import 'package:flutter/material.dart';

class GlobalColors {
  static MaterialColor arkadBlue = MaterialColor(0xFF002B64, _arkadBlueMap);
  static MaterialColor arkadLightBlue =
      MaterialColor(0xFFACD6EA, _arkadLightBlueMap);
  static MaterialColor arkadGrey = MaterialColor(0xFFE3E3E3, _arkadGreyMap);
  static MaterialColor arkadRed = MaterialColor(0xFF9E0B0F, _arkadRedMap);

  static Map<int, Color> _arkadBlueMap = {
    50: Color.fromRGBO(0, 43, 100, .1),
    100: Color.fromRGBO(0, 43, 100, .2),
    200: Color.fromRGBO(0, 43, 100, .3),
    300: Color.fromRGBO(0, 43, 100, .4),
    400: Color.fromRGBO(0, 43, 100, .5),
    500: Color.fromRGBO(0, 43, 100, .6),
    600: Color.fromRGBO(0, 43, 100, .7),
    700: Color.fromRGBO(0, 43, 100, .8),
    800: Color.fromRGBO(0, 43, 100, .9),
    900: Color.fromRGBO(0, 43, 100, 1),
  };
  static Map<int, Color> _arkadLightBlueMap = {
    50: Color.fromRGBO(172, 214, 234, .1),
    100: Color.fromRGBO(172, 214, 234, .2),
    200: Color.fromRGBO(172, 214, 234, .3),
    300: Color.fromRGBO(172, 214, 234, .4),
    400: Color.fromRGBO(172, 214, 234, .5),
    500: Color.fromRGBO(172, 214, 234, .6),
    600: Color.fromRGBO(172, 214, 234, .7),
    700: Color.fromRGBO(172, 214, 234, .8),
    800: Color.fromRGBO(172, 214, 234, .9),
    900: Color.fromRGBO(172, 214, 234, 1),
  };
  static Map<int, Color> _arkadGreyMap = {
    50: Color.fromRGBO(227, 227, 227, .1),
    100: Color.fromRGBO(227, 227, 227, .2),
    200: Color.fromRGBO(227, 227, 227, .3),
    300: Color.fromRGBO(227, 227, 227, .4),
    400: Color.fromRGBO(227, 227, 227, .5),
    500: Color.fromRGBO(227, 227, 227, .6),
    600: Color.fromRGBO(227, 227, 227, .7),
    700: Color.fromRGBO(227, 227, 227, .8),
    800: Color.fromRGBO(227, 227, 227, .9),
    900: Color.fromRGBO(227, 227, 227, 1),
  };
  static Map<int, Color> _arkadRedMap = {
    50: Color.fromRGBO(158, 11, 15, .1),
    100: Color.fromRGBO(158, 11, 15, .2),
    200: Color.fromRGBO(158, 11, 15, .3),
    300: Color.fromRGBO(158, 11, 15, .4),
    400: Color.fromRGBO(158, 11, 15, .5),
    500: Color.fromRGBO(158, 11, 15, .6),
    600: Color.fromRGBO(158, 11, 15, .7),
    700: Color.fromRGBO(158, 11, 15, .8),
    800: Color.fromRGBO(158, 11, 15, .9),
    900: Color.fromRGBO(158, 11, 15, 1),
  };
}
