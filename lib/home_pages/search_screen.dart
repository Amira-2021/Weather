import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home_pages/result_screen.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/shared/my_theme.dart';

class SearchScreen extends StatefulWidget {
  @override
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Widget build(BuildContext context) {
    var city = Provider.of<WeatherProvider>(context).cityName;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyTheme.defaultBackground.withOpacity(.5),
        title: Text(
          "WeatherApp",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blue[300]!,
              Colors.blue[100]!,
              Colors.orange[300]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Center(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 350,
                  height: 300,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 50),
                      child: TextFormField(
                        onChanged: (data) {
                          city = data;
                        },
                        onFieldSubmitted: (data) async {
                          city = data;
                          Provider.of<WeatherProvider>(context, listen: false)
                              .cityName = city;
                          WeatherServices weatherService = WeatherServices();
                          WeatherModel model =
                              await weatherService.getWeather(cityName: city!);
                          Provider.of<WeatherProvider>(context, listen: false)
                              .set(model);
                          onClick();
                        },
                        decoration: InputDecoration(
                          labelText: "Enter your country",
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.black),
                          suffixIcon: Icon(Icons.search, color: Colors.black),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Provider.of<WeatherProvider>(context, listen: false)
                            .cityName = city;
                        WeatherServices weatherService = WeatherServices();
                        WeatherModel model =
                            await weatherService.getWeather(cityName: city!);
                        Provider.of<WeatherProvider>(context, listen: false)
                            .set(model);
                        onClick();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.cyan[800]),
                          width: 320,
                          height: 55,
                          child: const Center(
                            child: Text(
                              "Search",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  ])))),
    );
  }

  onClick() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultScreen();
    }));
  }
}
