// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Math Ninja',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: Colors.white,
                letterSpacing: .5,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, '/homePage');
        }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
        actions:[IconButton(onPressed: (){}, icon:Icon(Icons.settings,color: Colors.white,))],
      ),
    );
  }
}
