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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
                strokeWidth:
                    4.0 // increase this value to make the indicator bigger
                ),
          ),
          SizedBox(
            height: 80,
            child: Image.asset("assets/images/s.png"),
          ),
        ],
      )),
    ));
  }
}
