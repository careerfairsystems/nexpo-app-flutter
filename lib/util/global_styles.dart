import 'package:flutter/material.dart';

import 'global_colors.dart';

class GlobalStyles {
  static TextStyle titleStyleScreen = new TextStyle(
    fontFamily: 'Avenir',
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static TextStyle buttonTextStyle = new TextStyle(
    fontFamily: 'Avenir',
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static TextStyle cardText = new TextStyle(
    fontFamily: 'Avenir',
    color: GlobalColors.arkadBlue,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static InputDecoration buildInputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
      hintText: hintText,
      labelText: hintText,
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
