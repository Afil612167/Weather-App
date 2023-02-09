import 'package:flutter/material.dart';
import 'package:weather_app_mc/controller/weather_provider.dart';

import '../../../constants/colors.dart';
import 'package:provider/provider.dart';

class CloudIcon extends StatelessWidget {
  const CloudIcon({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    switch (context.read<WeatherProvider>().curretShowingDetailsCat) {
      case "weatherCondition":
        return Icon(
          Icons.cloud,
          size: height / 12,
          color: white,
        );

      case "temperatureCelsius":
        return Icon(
          Icons.thermostat,
          size: height / 12,
          color: white,
        );
      case "humidity":
        return Icon(
          Icons.thermostat_rounded,
          size: height / 12,
          color: white,
        );

      case "feelsLikeCelsius":
        return Icon(
          Icons.thermostat_rounded,
          size: height / 12,
          color: white,
        );
      case "windSpeed":
       return Icon(Icons.cloud,size: height/12,color: white,);
      default:
       return Icon(Icons.cloud,size: height/12,color: white,);

    }
  }
}
