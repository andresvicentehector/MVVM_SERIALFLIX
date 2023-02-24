import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Hector_Show_movie/res/AppContextExtension.dart';

class MyTextViewTittle extends StatelessWidget {
  final label;

  MyTextViewTittle(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: context.resources.dimension.bigText,
          fontFamily: 'BebasNeue'),
    );
  }
}
