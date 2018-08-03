import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:calculator/knop.dart';
import 'package:calculator/myHomePage.dart';


class Menu extends StatelessWidget {
  final List lijstTekens;
  final Color buttonColor;
  final Color backGroundColor;


  const Menu(
      @required this.lijstTekens,
      @required this.buttonColor,
      @required this.backGroundColor
      ) : assert(
  lijstTekens != null,
  buttonColor != null,
  );



  @override
  Widget build(BuildContext context) {
    List<InkWell> _lijstKnoppen = new List(lijstTekens.length);
    for (int i = 0; i < lijstTekens.length; i++) {
      _lijstKnoppen[i] = InkWell(
        child: Knop(lijstTekens[i],buttonColor),
        onTap: () {
          tab(lijstTekens[i]);
        },
      );
    }

    return Scaffold(
      backgroundColor: buttonColor,
      body: Container(
        height: 500.0,
        color: backGroundColor,
        child: GridView.count(
          crossAxisCount: 4,
          children: _lijstKnoppen,
        ),
      ),
    );
  }
}
