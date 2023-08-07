class WeatherModel {
  String name;
  String iconImage;
  String lastUpdate;
  String date;
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
        date: data['location']['localtime'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c']);
  }
  @override
  String toString() {
    return "Name =$name ,"
        " Maxtemp =$maxTemp , Mintemp =$minTemp";
  }
}
