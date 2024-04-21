class WeatherModel {
  String cityName;
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {
        required this.cityName,
        required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(Map<String, dynamic> jsonData) {
    var data = jsonData["forecast"]["forecastday"][0]["day"];
    print(data);
    return WeatherModel(
        cityName:jsonData["location"]["name"] ,
        date: jsonData["location"]["localtime"],
        temp: data["avgtemp_c"],
        maxTemp: data["maxtemp_c"],
        minTemp: data["mintemp_c"],
        weatherStateName: data["condition"]["text"]);
  }

  @override
  String toString() {

    return """" temp = $temp ,
     data = $date ,
     maxTemp = $maxTemp,
     minTemp = $minTemp,
     weatherStateName = $weatherStateName
     cityName = $cityName
      """;
  }
}
