import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Hector_Show_movie/res/colors/BaseColors.dart';

class AppColorsDark implements BaseColors {
  Map<int, Color> _primary = {
    50: Color.fromRGBO(86, 77, 77, 0.01),
    100: Color.fromRGBO(86, 77, 77, 0.2),
    200: Color.fromRGBO(86, 77, 77, 0.3),
    300: Color.fromRGBO(86, 77, 77, 0.4),
    400: Color.fromRGBO(86, 77, 77, 0.5),
    500: Color.fromRGBO(86, 77, 77, 0.6),
    600: Color.fromRGBO(86, 77, 77, 0.7),
    700: Color.fromRGBO(86, 77, 77, 0.8),
    800: Color.fromRGBO(86, 77, 77, 0.9),
    900: Color.fromRGBO(86, 77, 77, 1.0),
  };

  @override
  MaterialColor get colorAccent => Colors.red;

  @override
  MaterialColor get colorPrimary => MaterialColor(0xFF3B3B3B, _primary);

  @override
  Color get colorPrimaryText => Color.fromRGBO(206, 24, 24, 1);

  @override
  Color get colorSecondaryText => Color.fromRGBO(255, 0, 0, 1.0);

  @override
  Color get colorWhite => Color(0xffffffff);

  @override
  Color get colorBlack => Color(0xff000000);

  @override
  Color get colorContainer => Color.fromARGB(255, 211, 202, 202);

  @override
  Color get castChipColor => Colors.deepOrangeAccent;

  @override
  Color get catChipColor => Colors.indigoAccent;
}
