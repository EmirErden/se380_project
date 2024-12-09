// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:se380_project/auth/login_or_register.dart';
import 'package:se380_project/models/question_model.dart';
import 'package:se380_project/pages/addition.dart';
import 'package:se380_project/pages/division.dart';
import 'package:se380_project/pages/extraction.dart';
import 'package:se380_project/pages/first_page.dart';
import 'package:se380_project/pages/multiplication.dart';
import 'package:se380_project/pages/profile_page.dart';
import 'package:se380_project/pages/register_page.dart';
import 'package:se380_project/pages/schedule_page.dart';
import 'pages/home.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

import './models/db_connect.dart';

void main() {
  var db = DBConnect();

  db.fetchQuestions();

  // db.addQuestions(Question(
  //     id: '1',
  //     firstNumber: '10',
  //     secondNumber: '10',
  //     options: {'8': false, '15': false, '20': true, '30': false}));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      routes: {
        '/Addition': (context) => Addition(),
        '/Extraction': (context) => Extraction(),
        '/Multiplication': (context) => Multiplication(),
        '/Division': (context) => Division(),
      },
    );
  }
}
