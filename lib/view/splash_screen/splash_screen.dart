import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app_mc/constants/colors.dart';
import 'package:weather_app_mc/controller/weather_provider.dart';
import 'package:weather_app_mc/servieces/fetch_weather.dart';
import 'package:weather_app_mc/servieces/get_ip_from_api.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_mc/view/dashboard_screen/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    fetchIpModel().then(
      (ipValue) {
        context.read<WeatherProvider>().ip = ipValue.ip!;
        context.read<WeatherProvider>().ipUpdate();
        // print(ipValue.ip);
        if (ipValue.ip!.isNotEmpty) {
          fetchWeatherModel(ipValue.ip).then((value) {
            if (value.current!.tempC != null) {
              // print(value.current!.humidity);
              context
                  .read<WeatherProvider>()
                  .storeWeatherData(
                    value.current!.cloud.toString(),
                      value.location!.name,
                      value.current!.tempC.toString(),
                      value.current!.humidity.toString(),
                      value.current!.feelslikeC.toString(),
                      value.current!.gustKph.toString())
                  .then((value) {
                context.read<WeatherProvider>().getStoredData().then((value) {
                  print(context.read<WeatherProvider>().cloud.toString());
                  Timer(
                    //the execution take some time so i give only 1.5 second
                    Duration(seconds: 1),
                    () {
                      // context.read<WeatherProvider>().searchListAdding();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ),
                      );
                    },
                  );
                });
              });
            }
          });
        }
      },
    );
    // print('done');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return const SafeArea(
      child: Scaffold(
        backgroundColor: purple,
        body: Center(
          child: Text(
            'Lilac flutter assignment',
            style: TextStyle(fontSize: 18, color: white),
          ),
        ),
      ),
    );
  }
}
