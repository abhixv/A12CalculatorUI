import 'package:calculator/pages/home_page.dart';
import 'package:calculator/utils/routes.dart';
import 'package:calculator/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.light(context),
      darkTheme: MyTheme.dark(context),
      home: HomePage(),
      initialRoute: Routes.homeRoutes,
    );
  }
}
