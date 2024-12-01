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
                    color: Colors.red,
                    shape: BoxShape.circle,
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
                  color: Colors.green,
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
                  color: Colors.blue,
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
                  color: Colors.orange,
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
