import 'package:app/pages/home_view.dart';
import 'package:app/providers/weather_provider.dart';
import 'package:app/weather_model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



WeatherModel? weatherData;

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
       create: (context) {
         return WeatherProvider();
       },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
