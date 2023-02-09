import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_mc/controller/weather_provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var searchCheck in context.read<WeatherProvider>().searchTerms) {
      if (searchCheck.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchCheck);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var searchCheck in context.read<WeatherProvider>().searchTerms) {
      if (searchCheck.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchCheck);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title:
              Consumer<WeatherProvider>(builder: (context, weatherProvider, _) {
            return InkWell(
                onTap: () {
                  switch (result) {
                    case 'temperatureCelsius':
                      print(result);
                      weatherProvider.curretShowingDetailsCat = result;
                      weatherProvider.currentShowingDetailsUpdate();
                      

                      weatherProvider.refreshAll();
                      break;
                    case 'weatherCondition':
                      weatherProvider.curretShowingDetailsCat = result;
                      weatherProvider.currentShowingDetailsUpdate();
                      break;
                    case 'humidity':
                      weatherProvider.curretShowingDetailsCat = result;
                      weatherProvider.currentShowingDetailsUpdate();
                      break;
                    case 'cloud':
                      weatherProvider.curretShowingDetailsCat = result;
                      weatherProvider.currentShowingDetailsUpdate();
                      break;
                    case 'feelsLikeCelsius':
                      weatherProvider.curretShowingDetailsCat = result;
                      weatherProvider.currentShowingDetailsUpdate();
                      break;
                    case 'windSpeed':
                      weatherProvider.curretShowingDetailsCat = result;
                      weatherProvider.currentShowingDetailsUpdate();
                      break;
                  }
                },
                child: Text(result));
          }),
        );
      },
    );
  }
}
