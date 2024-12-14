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
        title: Text('Math Ninja', style: GoogleFonts.nunito(textStyle: TextStyle(color: Colors.white,letterSpacing: .5,fontSize: 24,fontWeight: FontWeight.bold),),),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 30),
            const Center(child:Icon(Icons.calendar_today,size: 40,)),
            //Text
            Row(
              children: [
                const SizedBox(width: 25),
                Padding(padding: const EdgeInsets.symmetric(vertical:20),
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
