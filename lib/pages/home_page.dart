import 'dart:math';

import 'package:calculator/utils/routes.dart';
import 'package:calculator/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _exp = '';
  String _record = '';
  String _history = '';
  String _displayText = '';
  double _keyHeight = 400;
  double _keyWidth = 350;

  void numberClick(String text) {
    setState(() => _exp += text);
  }

  void clearAll(String text) {
    setState(() {
      _record = '';
      _exp = '0';
    });
  }

  void clear(String text) {
    setState(() {
      _exp = '';
    });
  }

  void evaluate(String text) {
    Parser parser = Parser();
    Expression exp = parser.parse(_exp);
    ContextModel context = ContextModel();

    setState(() {
      _record = _exp;
      _exp = exp.evaluate(EvaluationType.REAL, context).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.43,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, top: 50),
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            "$_exp",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 60,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: keyCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row first_row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => clear("C"),
              child: Center(
                child: Text(
                  "C",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("()"),
              child: Center(
                child: Text(
                  "()",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("%"),
              child: Center(
                child: Text(
                  "%",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("/"),
              child: Center(
                child: Text(
                  "/",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
      ],
    );
  }

  Row second_row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("7"),
              child: Center(
                child: Text(
                  "7",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("8"),
              child: Center(
                child: Text(
                  "8",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("9"),
              child: Center(
                child: Text(
                  "9",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("*"),
              child: Center(
                child: Text(
                  "x",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
      ],
    );
  }

  Row third_row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("4"),
              child: Center(
                child: Text(
                  "4",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("5"),
              child: Center(
                child: Text(
                  "5",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("6"),
              child: Center(
                child: Text(
                  "6",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("-"),
              child: Center(
                child: Text(
                  "-",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
      ],
    );
  }

  Row fourth_row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("1"),
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("2"),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("3"),
              child: Center(
                child: Text(
                  "3",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => evaluate("+"),
              child: Center(
                child: Text(
                  "+",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
      ],
    );
  }

  Row fifth_row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("0"),
              child: Center(
                child: Text(
                  "0",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => numberClick("."),
              child: Center(
                child: Text(
                  ".",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11.5,
            width: MediaQuery.of(context).size.width / 5.45,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => clear("C"),
              child: Center(
                  child: Icon(
                Icons.backspace_outlined,
                size: 30,
                color: Theme.of(context).accentColor,
              )),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 11,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(50.0)),
            child: InkWell(
              onTap: () => evaluate("="),
              child: Center(
                child: Text(
                  "=",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0),
                ),
              ),
              borderRadius: BorderRadius.circular(50.0),
            )),
        SizedBox(
          width: 15.0,
        ),
      ],
    );
  }

  Column keyCard() {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        first_row(),
        SizedBox(
          height: 10.0,
        ),
        second_row(),
        SizedBox(
          height: 10.0,
        ),
        third_row(),
        SizedBox(
          height: 10.0,
        ),
        fourth_row(),
        SizedBox(
          height: 10.0,
        ),
        fifth_row(),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
