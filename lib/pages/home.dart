// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:se380_project/pages/profile_page.dart';
import 'package:se380_project/pages/schedule_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math Ninja', style: GoogleFonts.nunito(textStyle: TextStyle(color: Colors.white,letterSpacing: .5,fontSize: 24,fontWeight: FontWeight.bold),),),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(), //blank until end
          //SUBTITLE
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text('Categories', style: GoogleFonts.nunito(textStyle: TextStyle(
            color: Colors.black,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: TextDecoration.underline,
            decorationThickness: 4,
          ),
          ),
          ),
          ),
          GridView.count(
            crossAxisCount: 2, // box next to other one
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Addition');
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffFE4F73),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        'Addition',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/Extraction');
                },
              // EXTRACTION BOX
              child: Container(
                margin: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff468AB8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      'Extraction',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/Multiplication');
                },
              // MULTIPLICATION BOX
              child: Container(
                margin: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffDFAC8B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.clear, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      'Multiplication',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/Division');
                },
              // DIVISION BOX
              child: Container(
                margin: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff30C562),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.divide, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      'Division',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
