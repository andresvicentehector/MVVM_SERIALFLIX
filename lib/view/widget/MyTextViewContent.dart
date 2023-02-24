import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Hector_Show_movie/res/AppContextExtension.dart';

class MyTextViewContent extends StatelessWidget {
  final label;

  MyTextViewContent(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontSize: context.resources.dimension.defaultText,
          fontFamily: 'googlesansregular'),
    );
  }
}
