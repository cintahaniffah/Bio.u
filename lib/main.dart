import 'package:biouapp/welcome_screen.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import 'constants.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BuildContext get content => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    // var GoogleFonts;
    var materialApp = MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: kPrimaryColor,
      //   // textTheme: GoogleFonts.roboto().fontFamily,
      // ),
      home: WelcomeScreen(),
    );
    return materialApp;
  }
}

