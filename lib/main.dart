import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:floop/floop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Smesh Demo', theme: appTheme, home: LoginPage());
  }
}

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');
