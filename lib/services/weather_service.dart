import 'dart:convert';
import 'package:app/weather_model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class WeatherService {
  String apiKey = "0332f495b3b443e0964220521241904";
  String baseUrl = "http://api.weatherapi.com/v1";

  Future<dynamic> getWeather({required String cityName}) async {

    // Uri url = Uri.http(
    //   baseUrl ,
    //   "/v1/forecast.json",
    //     {
    //     "key": apiKey,
    //       "q": cityName,
    // }
    // );
    //   dynamic response = await http.get(url);
    //   List<WeatherModel> weatherList = [];
    //   if(response.statusCode==200){
    //     Map<String , dynamic> data = jsonDecode(response.body);
    //     var weatherDataList= data["forecast"] as List;
    //     for(var e in  weatherDataList){
    //       weatherList.add(WeatherModel.fromJson(e));
    //     }
    //     return weatherList;
    //   }
    //   else {
    //     throw Exception("field to loud data ");
    //   }




    Uri url =
    Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName");
    print(url);
    dynamic response = await http.get(url);
    Map<String , dynamic> data = jsonDecode(response.body);
    WeatherModel weatherModel = WeatherModel.fromJson(data);
       return weatherModel;

  }
}
