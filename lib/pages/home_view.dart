import 'package:app/pages/search_view.dart';
import 'package:app/weather_model/weather_model.dart';
import 'package:app/widgets/weather_info_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../providers/weather_provider.dart';
import '../widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<WeatherProvider>(context);
    print("home page weather = ${vm.weatherData}");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SearchView();
                },
              ));
            },
            icon: Icon(
              Icons.search_rounded,
              size: 30,
            ),
          )
        ],
        title: const Text('Weather App'),
      ),
      body: vm.weatherData != null
          ? WeatherInfoBody() :  NoWeatherBody(),
    );

  }
}
