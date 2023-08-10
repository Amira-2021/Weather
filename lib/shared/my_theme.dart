import 'package:flutter/material.dart';

class MyTheme {
  static const Color defaultBackground = Colors.blueAccent;
  static ThemeData LightTheme = ThemeData(
      appBarTheme:
          AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      scaffoldBackgroundColor: defaultBackground);
}
