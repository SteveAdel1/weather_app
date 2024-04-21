import 'package:app/weather_model/weather_model.dart';
import 'package:flutter/widgets.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;

  String getImage() {
    switch (weatherData!.weatherStateName) {
      case "Partly Cloudy ":
        {
          return "assets/gifs/partly_cloudy.gif";
        }
      case "Sunny" :
        {
          return "assets/gifs/sun.gif";
        }
      case "Clear":
        {
          return "assets/gifs/sun.gif";
        }
      case "Cloudy" && "Patchy rain nearby" :
        {
          return "assets/gifs/partly_cloudy.gif";
        }
      case "Fog":
        {
          return "assets/gifs/haze.gif";
        }
      default :
        {
          return "assets/gifs/sun.gif";
        }
    }
  }
}

