import 'package:flutter/material.dart';

var knop = "";

class Knop extends StatelessWidget {
  var knop;
  var color;

  Knop(
    this.knop,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        color: color,
        child: Center(
          child: Text(
            knop,
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
