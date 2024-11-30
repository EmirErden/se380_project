// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void userTapped(){
    print("user tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
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
        leading: Icon(Icons.menu,color: Colors.white,),
        actions:[IconButton(onPressed: (){
          Navigator.pushNamed(context, '/settings');
        }, icon:Icon(Icons.settings,color: Colors.white,))],
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.purple[200],
            child: Center(child: Text("Tap me!")),
          ),
        )

      )
    );
  }
}
