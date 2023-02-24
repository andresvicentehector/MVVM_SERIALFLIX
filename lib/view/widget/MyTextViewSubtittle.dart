import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Hector_Show_movie/res/AppContextExtension.dart';

class MyTextViewSubtittle extends StatelessWidget {
  final label;

  MyTextViewSubtittle(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontSize: context.resources.dimension.smallText,
          fontFamily: 'googlesansregular'),
    );
  }
}
