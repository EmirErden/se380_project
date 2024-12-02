// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:se380_project/pages/profile_page.dart';
import 'package:se380_project/pages/settings_page.dart';

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
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Spacer(), //blank until end
          GridView.count(
            crossAxisCount: 2, // box next to other one
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/Addition');
                },
                // ADDITION BOX
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Center(child: Text('Addition', style: GoogleFonts.nunito(textStyle: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                  ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 79, 115,1),
                    borderRadius: BorderRadius.circular(20),
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
                child: Center(child: Text('Extraction', style: GoogleFonts.nunito(textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(70, 138, 184,1),
                  borderRadius: BorderRadius.circular(20),
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
                child: Center(child: Text('Multiplication', style: GoogleFonts.nunito(textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(223, 172, 139,1),
                  borderRadius: BorderRadius.circular(20),
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
                child: Center(child: Text('Division', style: GoogleFonts.nunito(textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(208, 197, 68,1),
                  borderRadius: BorderRadius.circular(20),
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
