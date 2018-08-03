import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:calculator/knop.dart';
import 'package:calculator/main.dart';
import 'package:calculator/menu.dart';

var _lijstTekens = [
  "(",
  ")",
  "x²",
  "sqr(",
  "sin(",
  "cos(",
  "tan(",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""
];

class MenuExtra extends StatelessWidget {
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.red,
        height: 40.0,
      ),
    );
  }
}
