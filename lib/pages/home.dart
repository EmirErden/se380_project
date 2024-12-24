// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:se380_project/components/quit_box.dart';
import 'package:se380_project/pages/addition.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:se380_project/pages/extraction.dart';
import 'package:se380_project/pages/multiplication.dart';
import 'package:se380_project/pages/division.dart';

import '../models/User.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffbf7),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.output_outlined, color: Colors.white),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return QuitBox(user: widget.user);
              },
            );
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
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
      ),
      body: Column(
        // Greeting message
        children: [
          SizedBox(height: 25),
          Row(
            children: [
              SizedBox(width: 35),
              Icon(LineIcons.userNinja, size: 35),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Hello, welcome back! ",
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
              ),
            ],
          ),
          //Ninja svg
          SizedBox(height: 20),
          SvgPicture.asset(
            'assets/icons/ninja.svg',
            width: 150,
            height: 125,
          ),
          Spacer(), //blank until end
          //SUBTITLE
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: Text(
                'Categories',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
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
          ),
          GridView.count(
            crossAxisCount: 2, // box next to other one
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Addition(
                        user: widget.user,
                      ),
                    ),
                  );
                },
                //addition box
                child: Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffFE4F60),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Extraction(
                        user: widget.user,
                      ),
                    ),
                  );
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Multiplication(
                        user: widget.user,
                      ),
                    ),
                  );
                },
                // MULTIPLICATION BOX
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffDFAC60),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Multiplication(
                        user: widget.user,
                      ),
                    ),
                  );
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
