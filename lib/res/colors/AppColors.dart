import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Hector_Show_movie/res/colors/BaseColors.dart';

class AppColors implements BaseColors {
  Map<int, Color> _primary = {
    50: Color.fromRGBO(219, 0, 0, 0.1),
    100: Color.fromRGBO(219, 0, 0, 0.2),
    200: Color.fromRGBO(219, 0, 0, 0.3),
    300: Color.fromRGBO(219, 0, 0, 0.4),
    400: Color.fromRGBO(219, 0, 0, 0.5),
    500: Color.fromRGBO(219, 0, 0, 0.6),
    600: Color.fromRGBO(219, 0, 0, 0.7),
    700: Color.fromRGBO(219, 0, 0, 0.8),
    800: Color.fromRGBO(219, 0, 0, 0.9),
    900: Color.fromRGBO(219, 0, 0, 1.0),
  };

  @override
  MaterialColor get colorAccent => Colors.amber;

  @override
  MaterialColor get colorPrimary => MaterialColor(0xFFD81B1B, _primary);

  @override
  Color get colorPrimaryText => Color.fromARGB(255, 0, 0, 0);

  @override
  Color get colorSecondaryText => Color.fromARGB(255, 0, 0, 0);

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
