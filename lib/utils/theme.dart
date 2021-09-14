import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData light(BuildContext context) => ThemeData(
      appBarTheme: AppBarTheme(
        color: Color(0xFFF6F8DC),
        elevation: 0.0,
        textTheme: Theme.of(context).textTheme,
      ),
      backgroundColor: Color(0xfffaeef0),
      brightness: Brightness.light,
      accentColor: Colors.black,
      cardColor: Color(0xfffdd8e7),
      buttonColor: Color(0xfffdd8e7),
      canvasColor: Color(0xff95406d),
      cardTheme: CardTheme(color: Color(0xff95406d)));

  static ThemeData dark(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
        ),
        backgroundColor: Color(0xff23181c),
        brightness: Brightness.dark,
        accentColor: Color(0xfff4f2f2),
        cardColor: Color(0xff2f2629),
        buttonColor: Color(0xff362f31),
        canvasColor: Color(0xffa46477),
      );
}
