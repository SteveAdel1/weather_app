import 'package:app/pages/home_view.dart';
import 'package:app/providers/weather_provider.dart';
import 'package:app/services/weather_service.dart';
import 'package:app/weather_model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';


class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  String? cityName;
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              cityName = value;
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              vm.weatherData= weather;
              // Navigator.pop(context);
              print("weatherData is ${vm.weatherData}");
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeView(),), (route) => false);
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 30),
                label: Text("Search"),
                hintText: "Enter a City",
                suffixIcon: Icon(Icons.search_rounded),
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
