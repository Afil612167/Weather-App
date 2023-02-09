import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_mc/constants/shared_preference_keys.dart';

class WeatherProvider extends ChangeNotifier {
  String ip = '103.151.188.139';

  ipUpdate() {
    ip = ip;
    notifyListeners();
  }

  //Storing datas in shared preference

  Future<void> storeWeatherData(
      String? cloud,
      String? location,
      String? temperatureCelsius,
      String? humidity,
      String? feelsLikeCelsius,
      String? gustSpeedKmph) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(cloudKey, cloud!);
    await prefs.setString(locationKey, location!);
    await prefs.setString(temperatureCelsiusKey, temperatureCelsius!);
    await prefs.setString(humidityKey, humidity!);
    await prefs.setString(feelsLikeCelsiusKey, feelsLikeCelsius!);
    await prefs.setString(gustSpeedkmphKey, gustSpeedKmph!);
    notifyListeners();
  }

  //get data from sharedPreference
  String? currentShowingDetails;
  String? location;
  String? temperatureCelsius;
  String? humidity;
  String? feelsLikeCelsius;
  String? gustSpeedKmp;
  String? cloud;
  Future<void> getStoredData() async {
    final prefs = await SharedPreferences.getInstance();
    location = prefs.getString(locationKey)!;
    temperatureCelsius = prefs.getString(temperatureCelsiusKey)!;
    humidity = prefs.getString(humidityKey)!;
    feelsLikeCelsius = prefs.getString(feelsLikeCelsiusKey)!;
    gustSpeedKmp = prefs.getString(gustSpeedkmphKey)!;
    cloud = prefs.getString(cloudKey);
    currentShowingDetails = "${cloud} oktas";
    notifyListeners();
  }

  //add details to search list

  List<String> searchTerms = [
    'temperatureCelsius',
    'humidity',
    'cloud',
    'feelsLikeCelsius',
    'windSpeed'
  ];
//current details showing
  String? curretShowingDetailsCat;
  currentShowingDetailsUpdate() {
    switch (curretShowingDetailsCat) {
      case "temperatureCelsius":
        curretShowingDetailsCat = "temperatureCelsius";
        currentShowingDetails = "${temperatureCelsius} °C";
        refreshAll();
        break;
      case "humidity":
        curretShowingDetailsCat = "humidity";
        currentShowingDetails = humidity;
        refreshAll();
        break;
      case "feelsLikeCelsius":
        curretShowingDetailsCat = "feelsLikeCelsius";
        currentShowingDetails = "${feelsLikeCelsius} °C";
        refreshAll();
        break;
      case "windSpeed":
        curretShowingDetailsCat = "Speed";
        currentShowingDetails = "${gustSpeedKmp} knots";
        refreshAll();
        break;
      default:
        curretShowingDetailsCat = '${cloud} oktas';
    }
    print("updated" + currentShowingDetails.toString());
    notifyListeners();
  }

  refreshAll() {
    curretShowingDetailsCat = curretShowingDetailsCat;
    currentShowingDetails = currentShowingDetails;
    print('refreshed');
    notifyListeners();
  }
  //weather icons
}
