import 'package:flutter/material.dart';

class WeatherModel {
  String name;
  String iconImage;
  String lastUpdate;
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.name,
      required this.iconImage,
      required this.lastUpdate,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    print("Date = ${data['location']['localtime']}");
    return WeatherModel(
        iconImage: data['current']['condition']['icon'],
        lastUpdate: data['current']['last_updated'],
        temp: jsonData['avgtemp_c'],
        weatherStateName: jsonData['condition']['text'],
        name: data['location']['name'],
        date: DateTime.parse(data['location']['localtime']),
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c']);
  }
  @override
  String toString() {
    return "Name =$name ,"
        " Maxtemp =$maxTemp , Mintemp =$minTemp";
  }

  String getImage() {
    if (weatherStateName == 'Sunny') {
      return "assets/images/day/113.png";
    } else if (weatherStateName == 'Overcast') {
      return "assets/images/day/116.png";
    } else if (weatherStateName == 'Patchy rain possible') {
      return "assets/images/day/rainy.png";
    } else if (weatherStateName == 'Cloudy') {
      return "assets/images/day/cloudy.png";
    } else if (weatherStateName == 'Snow') {
      return "assets/images/day/snow.png";
    } else if (weatherStateName == 'Thunder') {
      return "assets/images/day/thunderstorm.png";
    } else {
      return "assets/images/day/clear.png";
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny') {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
