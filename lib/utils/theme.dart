import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData light(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFFF6F8DC),
          elevation: 0.0,
          textTheme: Theme.of(context).textTheme,
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        accentColor: Colors.black,
        cardColor: Colors.grey.withOpacity(0.1),
        buttonColor: Colors.grey,
      );

  static ThemeData dark(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
        ),
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        accentColor: Colors.white,
        cardColor: Colors.deepPurple.withOpacity(0.1),
        buttonColor: Colors.grey.withOpacity(0.1),
      );
}
