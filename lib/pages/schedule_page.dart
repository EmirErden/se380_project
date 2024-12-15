// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streak_calendar/streak_calendar.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffbf7),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.output_outlined, color: Colors.white),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/LoginOrRegister');
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Schedule Page',
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            const Center(child:Icon(Icons.calendar_today,size: 50,)),
            //Text line
            Row(
              children: [
                const SizedBox(width: 25,),
                Padding(padding: const EdgeInsets.symmetric(vertical:40, horizontal: 20),
                  child: Text("You can see the dates you\nlogged in.", style: GoogleFonts.nunito(
                    textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),
                  ),),
                ),
              ],
            ),
            //Streak Calender
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: CleanCalendar(
                startWeekday: WeekDay.monday,
                datesForStreaks: [
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
