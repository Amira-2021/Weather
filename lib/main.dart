import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home_pages/logo_screen.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/shared/my_theme.dart';

void main() {
  runApp(Weather());
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogoScreen(),
        theme: MyTheme.LightTheme,
      ),
    );
  }
}
