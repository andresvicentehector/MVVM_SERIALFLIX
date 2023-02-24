import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 80,
      child: Center(
          child: Stack(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 48,
            child: Image.asset("assets/images/s.png"),
          ),
        ],
      )),
    ));
  }
}
