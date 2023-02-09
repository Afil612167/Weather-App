import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app_mc/model/weather_model.dart';

Future<WeatherModel> fetchWeatherModel(String? ip) async {
  final response = await http
      .get(Uri.parse('https://api.weatherapi.com/v1/current.json?key=c0dbb6f1794640eeabf103014222805&q=$ip&aqi=no'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return WeatherModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load IpModel');
  }
}