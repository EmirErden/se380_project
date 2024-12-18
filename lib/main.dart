// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:se380_project/auth/login_or_register.dart';
import 'package:se380_project/pages/division.dart';
import 'package:se380_project/pages/extraction.dart';
import 'package:se380_project/pages/multiplication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/auth_services.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      routes: {
        //every class that has /firstPage and /Homepage and /addition will change!!!!!!!!!!
        '/LoginOrRegister': (context) => LoginOrRegister(),
        '/Extraction': (context) => Extraction(),
        '/Multiplication': (context) => Multiplication(),
        '/Division': (context) => Division(),
      },
    );
  }
}
