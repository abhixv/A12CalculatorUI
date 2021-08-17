import 'package:calculator/utils/routes.dart';
import 'package:calculator/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _exp = '';
  String _record = '';
  double _height = 250;
  double _width = 350;
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
      _exp = '';
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
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
              //fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w100),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                AnimatedContainer(
                  alignment: Alignment.center,
                  height: _height,
                  width: _width,
                  duration: const Duration(seconds: 1),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "$_displayText",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Flexible(
                            child: Text(
                              "$_history",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _height = 600;
                                  _history = _record;
                                  _displayText = "History";
                                  _keyHeight = 0;
                                  _keyWidth = 0;
                                });
                              },
                              onDoubleTap: () {
                                setState(() {
                                  _height = 250;
                                  _history = '';
                                  _displayText = '';
                                  _keyHeight = 400;
                                  _keyWidth = 350;
                                });
                              },
                              child: Icon(
                                Icons.calculate_outlined,
                                color: Theme.of(context).accentColor,
                                size: 30.0,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "$_exp",
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                keyCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row first_row() {
    return Row(
      children: [
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("7"),
              child: Center(
                child: Text(
                  "7",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            alignment: Alignment.center,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("8"),
              child: Center(
                child: Text(
                  "8",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            alignment: Alignment.center,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("9"),
              child: Center(
                child: Text(
                  "9",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            alignment: Alignment.center,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("/"),
              child: Center(
                child: Text(
                  "/",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            alignment: Alignment.center,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => clear("C"),
              child: Center(
                child: Icon(
                  Icons.backspace,
                  color: Theme.of(context).accentColor,
                  size: 16.0,
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
      ],
    );
  }

  Row second_row() {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.zero,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("4"),
              child: Center(
                child: Text(
                  "4",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("5"),
              child: Center(
                child: Text(
                  "5",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("6"),
              child: Center(
                child: Text(
                  "6",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("*"),
              child: Center(
                child: Text(
                  "x",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => clearAll("C"),
              child: Center(
                child: Text(
                  "C",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
      ],
    );
  }

  Row third_row() {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.zero,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("1"),
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("2"),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("3"),
              child: Center(
                child: Text(
                  "3",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("-"),
              child: Center(
                child: Text(
                  "-",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  "",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
      ],
    );
  }

  Row fourth_row() {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.zero,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("."),
              child: Center(
                child: Text(
                  ".",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("0"),
              child: Center(
                child: Text(
                  "0",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("%"),
              child: Center(
                child: Text(
                  "%",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("+"),
              child: Center(
                child: Text(
                  "+",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => evaluate("="),
              child: Center(
                child: Text(
                  "=",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w100,
                      fontSize: 25.0),
                ),
              ),
              borderRadius: BorderRadius.circular(16.0),
            )),
        SizedBox(
          width: 5.0,
        ),
      ],
    );
  }

  Container keyCard() {
    return Container(
      alignment: Alignment.center,
      height: _keyHeight,
      width: _keyWidth,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}
