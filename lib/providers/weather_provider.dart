import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  String? cityName;
  WeatherModel? _weatherData;
  set(WeatherModel weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get() => _weatherData!;
}
