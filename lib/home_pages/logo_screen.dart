import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/home_pages/search_screen.dart';
import 'package:weather_app/shared/my_theme.dart';

class LogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SearchScreen()));
    });
    return Scaffold(
      backgroundColor: MyTheme.defaultBackground,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    "assets/images/cloudy.png",
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.color,
                  ),
                ),
                Text(
                  "Weather App",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
