import 'package:flutter/material.dart';
import 'package:calculator/menu.dart';

_MyHomePageState homePagina = new _MyHomePageState();

const Color defaultButton = Colors.blueGrey;
const Color advancedButton = Colors.black38;
const Color backgroundColor = Colors.blue;
const Color displayColor = Colors.green;

String display = "";

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => homePagina;
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          Container(
            height: 60.0,
            color: displayColor,
            child: InkWell(
              onTap: () {
                setState(() {});
              },
              child: Center(
                child: Text(
                  display,
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          ),
          new Container(
            decoration: new BoxDecoration(color: backgroundColor),
            child: new TabBar(
              controller: _controller,
              tabs: [
                new Tab(
                  text: 'default',
                ),
                new Tab(
                  text: 'advanced',
                ),
              ],
            ),
          ),
          new Container(
            height: 450.0,
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                new Menu([
                  "7",
                  "8",
                  "9",
                  "/",
                  "4",
                  "5",
                  "6",
                  "X",
                  "1",
                  "2",
                  "3",
                  "-",
                  ".",
                  "0",
                  "=",
                  "+",
                  "",
                  "extra",
                  "c",
                  ""
                ], defaultButton, backgroundColor),
                new Menu([
                  "(",
                  ")",
                  "x^n",
                  "n√(x)",
                  "sin",
                  "cos",
                  "tan",
                  "ln",
                  "!",
                  "log",
                  "e",
                  "π",
                  "",
                  "back",
                  "c",
                  ""
                ], advancedButton, backgroundColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void tab(var knop) {
  if (knop == "=") {
    display = bereken(display);
    if(display.substring(display.length-2,display.length) == ".0")
      display = display.substring(0,display.length-2);
  } else if (knop == "c") {
    if (display == "") return;
    display = display.substring(0, display.length - 1);
  } else if (knop == "extra") {
  } else
    display = display + knop;
  homePagina.setState(() {});
}


String bereken(String berekening) {

  while (berekening.contains("(") || berekening.contains(")")) {
    berekening = zoekHaakje(berekening, 0);
  }

  if (berekening.contains("+") || berekening.contains("-")) {
    int plusIndex = berekening.lastIndexOf("+");
    int minIndex = berekening.lastIndexOf("-");
    if (minIndex > 0 || plusIndex > 0) {
      if (plusIndex > minIndex) {
        String deel1 = bereken(berekening.substring(0, plusIndex));
        String deel2 =
            bereken(berekening.substring(plusIndex + 1, berekening.length));
        return (double.tryParse(deel1) + double.tryParse(deel2)).toString();
        ;
      } else {
        String deel1 = bereken(berekening.substring(0, minIndex));
        String deel2 =
            bereken(berekening.substring(minIndex + 1, berekening.length));
        return (double.tryParse(deel1) - double.tryParse(deel2)).toString();
      }
    }
  }

  if (berekening.contains("X") || berekening.contains("/")) {
    int deelIndex = berekening.lastIndexOf("/");
    int maalIndex = berekening.lastIndexOf("X");

    if (maalIndex > deelIndex) {
      String deel1 = bereken(berekening.substring(0, maalIndex));
      String deel2 =
          bereken(berekening.substring(maalIndex + 1, berekening.length));
      return (double.tryParse(deel1) * double.tryParse(deel2)).toString();
    } else {
      String deel1 = bereken(berekening.substring(0, deelIndex));
      String deel2 =
          bereken(berekening.substring(deelIndex + 1, berekening.length));
      return (double.tryParse(deel1) / double.tryParse(deel2)).toString();
    }
  }
  return berekening;
}


String zoekHaakje(String berekening, int nr) {
  int openIndex = berekening.indexOf("(");
  int geslotenIndex = berekening.indexOf(")");

  if ((openIndex < geslotenIndex || geslotenIndex == -1) && openIndex != -1) {
    nr++;
    berekening = berekening.substring(0, openIndex) +
        "{" +
        berekening.substring(openIndex + 1, berekening.length);
  } else if (geslotenIndex != -1) {
    nr--;
    berekening = berekening.substring(0, geslotenIndex) +
        "}" +
        berekening.substring(geslotenIndex + 1, berekening.length);
  }

  while (nr != 0) {
    openIndex = berekening.indexOf("(");
    geslotenIndex = berekening.indexOf(")");

    if ((openIndex < geslotenIndex || geslotenIndex == -1) && openIndex != -1) {
      nr++;
      berekening = berekening.substring(0, openIndex) +
          "{" +
          berekening.substring(openIndex + 1, berekening.length);
    } else if (geslotenIndex != -1) {
      nr--;
      berekening = berekening.substring(0, geslotenIndex) +
          "}" +
          berekening.substring(geslotenIndex + 1, berekening.length);
    }
  }


  berekening =
      berekening.substring(0, berekening.indexOf("{")) +
          bereken(berekening.substring(berekening.indexOf("{") + 1, berekening.lastIndexOf("}")).replaceAll("{", "(").replaceAll("}", ")")) +
          berekening.substring(berekening.lastIndexOf("}") + 1, berekening.length);
  return berekening;
}