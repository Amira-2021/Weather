import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        appBar: AppBar(
          title: text(txt: "Result", font: 24),
          backgroundColor: MyTheme.defaultBackground.withOpacity(.5),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blue[300]!,
              Colors.orange[300]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 3,
                ),
                text(txt: weather!.name, font: 35),
                text(
                    txt:
                        "Update :   ${DateFormat.jm().format(Provider.of<WeatherProvider>(context).get()!.date)}"),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      weather.getImage(),
                      scale: .8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: text(txt: " ${weather!.temp.toInt()}", font: 35),
                    ),
                    Column(
                      children: [
                        text(txt: "maxTemp : ${weather!.maxTemp.toInt()}"),
                        text(txt: "minTemp : ${weather.minTemp.toInt()}"),
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
        ));
  }
}
