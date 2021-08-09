import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _exp = '';

  void numberClick(String text) {
    setState(() => _exp += text);
  }

  void clearAll(String text) {
    setState(() {
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
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                displayCard(),
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("7"),
              child: Center(
                child: Text(
                  "7",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("8"),
              child: Center(
                child: Text(
                  "8",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("9"),
              child: Center(
                child: Text(
                  "9",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("/"),
              child: Center(
                child: Text(
                  "/",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => clear("C"),
              child: Center(
                child: Icon(
                  Icons.backspace,
                  color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("4"),
              child: Center(
                child: Text(
                  "4",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("5"),
              child: Center(
                child: Text(
                  "5",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("6"),
              child: Center(
                child: Text(
                  "6",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("*"),
              child: Center(
                child: Text(
                  "x",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => clearAll("C"),
              child: Center(
                child: Text(
                  "C",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("1"),
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("2"),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("3"),
              child: Center(
                child: Text(
                  "3",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("-"),
              child: Center(
                child: Text(
                  "-",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  "",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("."),
              child: Center(
                child: Text(
                  ".",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("0"),
              child: Center(
                child: Text(
                  "0",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  "",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => numberClick("+"),
              child: Center(
                child: Text(
                  "+",
                  style: TextStyle(
                      color: Colors.white,
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
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () => evaluate("="),
              child: Center(
                child: Text(
                  "=",
                  style: TextStyle(
                      color: Colors.white,
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
      height: 400,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.1),
          border: Border.all(color: Colors.white),
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

  Container displayCard() {
    return Container(
      alignment: Alignment.center,
      height: 200,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.1),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.calculate_outlined,
              color: Colors.white,
              size: 30.0,
            ),
            Text(
              "$_exp",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
