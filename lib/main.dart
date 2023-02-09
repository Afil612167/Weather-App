import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_mc/controller/weather_provider.dart';
import 'package:weather_app_mc/view/splash_screen/splash_screen.dart';

main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      )));
}
