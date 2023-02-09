import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_mc/constants/colors.dart';
import 'package:weather_app_mc/controller/weather_provider.dart';
import 'package:weather_app_mc/view/dashboard_screen/widgets/custom_search_deligate.dart';
import 'package:weather_app_mc/view/dashboard_screen/widgets/weather_icons.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().curretShowingDetailsCat = 'cloud';
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return SafeArea(
      child: Consumer<WeatherProvider>(builder: (context, weatherProvider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: mainPink,
            title: Text(weatherProvider.curretShowingDetailsCat!),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: height / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined,color: mainBlack,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    weatherProvider.location.toString(),
                    style: TextStyle(
                      fontSize: height / 36,
                      fontWeight: FontWeight.bold,
                      color: mainBlack,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 20),
              Container(
                height: height / 2,
                width: width * 0.9,
                decoration: BoxDecoration(
                  color: mainPink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: height / 25)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       CloudIcon(height: height),
                       Padding(padding: EdgeInsets.only(left: width/20)),
                        Text(
                          weatherProvider.curretShowingDetailsCat!,
                          style: TextStyle(fontSize: 20, color: white),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: height / 35)),
                    Text(
                      weatherProvider.currentShowingDetails.toString(),
                      style: TextStyle(fontSize: height / 30, color: white),
                    ),
                    Padding(padding: EdgeInsets.only(top: height / 20)),
                    Text(
                      weatherProvider.curretShowingDetailsCat!,
                      style: TextStyle(fontSize: height / 32, color: white),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
