// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text(
          'Math Ninja',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: Colors.black,
                letterSpacing: .5,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {debugPrint("Clicked menu");},
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 20,
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
                width: 5,
                height: 5,
              ),
              decoration: BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {debugPrint("Clicked back");},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/Arrow - Left 2.svg',
              width: 20,
              height: 20,
            ),
            decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      body:  Container(
        width: 1000,
        height: 1000,
        alignment: Alignment.bottomLeft,
        child: Container(
          width: 175,
          height: 150,
          margin: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text('Addition',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
