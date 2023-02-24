import 'package:flutter/cupertino.dart';
import 'package:Hector_Show_movie/res/Resources.dart';
import 'package:Hector_Show_movie/res/dimentions/AppDimension.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
