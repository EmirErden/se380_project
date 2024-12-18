// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Multiplication extends StatelessWidget {
  const Multiplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDFAC60),
      appBar: AppBar(
        title: Text('Math Ninja', style: GoogleFonts.nunito(textStyle: TextStyle(color: Colors.white,letterSpacing: .5,fontSize: 24,fontWeight: FontWeight.bold),),),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Text("Multiplication Page"),
      ),
    );
  }
}
