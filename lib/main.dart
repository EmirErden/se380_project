// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:se380_project/pages/addition.dart';
import 'package:se380_project/pages/division.dart';
import 'package:se380_project/pages/extraction.dart';
import 'package:se380_project/pages/first_page.dart';
import 'package:se380_project/pages/multiplication.dart';
import 'package:se380_project/pages/profile_page.dart';
import 'package:se380_project/pages/settings_page.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/Addition': (context) => Addition(),
        '/Extraction': (context) => Extraction(),
        '/Multiplication': (context) => Multiplication(),
        '/Division': (context) => Division(),
      },
    );
  }
}
