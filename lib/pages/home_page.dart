import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            displayCard(),
            keyPad(),
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
    );
  }
}

Container keyPad() {
  return Container();
}
