import 'package:flutter/cupertino.dart';
import 'package:Hector_Show_movie/res/colors/AppColors.dart';
import 'package:Hector_Show_movie/res/colors/AppColors_dark.dart';

import 'package:Hector_Show_movie/res/dimentions/AppDimension.dart';
import 'package:Hector_Show_movie/res/strings/SpanishStrings.dart';
import 'package:Hector_Show_movie/res/strings/Strings.dart';

import 'strings/EnglishStrings.dart';

class Resources {
  BuildContext _context;

  Resources(this._context);

  Strings get strings {
    // It could be from the user preferences or even from the current locale
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'es':
        return SpanishStrings();
      default:
        return EnglishStrings();
    }
  }

  AppColors get color {
    return AppColors();
  }

  AppColorsDark get colorDark {
    return AppColorsDark();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
