import 'package:flutter/material.dart';
import 'package:calculator/menu.dart';
import 'package:calculator/myHomePage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
    );
  }
}
