import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text({required String txt, double font = 22}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      txt,
      style: TextStyle(
          fontSize: font, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
