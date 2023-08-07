import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/shared/components.dart';
import 'package:weather_app/shared/my_theme.dart';

class ResultScreen extends StatefulWidget {
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var weather = Provider.of<WeatherProvider>(context).get();
    return Scaffold(
      backgroundColor: MyTheme.defaultBackground,
      appBar: AppBar(
        title: text(txt: "Result", font: 24),
        backgroundColor: MyTheme.defaultBackground.withOpacity(.5),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            text(txt: weather!.name, font: 35),
            text(txt: "Update : 12:00 PM"),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 200, height: 200, child: Image.asset("assets/")),

                // Image.asset("assets/images/clear.png"),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: text(txt: " ${weather!.temp}", font: 35),
                ),
                Column(
                  children: [
                    text(txt: "${weather!.maxTemp}"),
                    text(txt: "${weather.minTemp}"),
                  ],
                ),
              ],
            ),
            Spacer(),
            text(txt: weather!.weatherStateName, font: 35),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
