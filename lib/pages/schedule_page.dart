// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streak_calendar/streak_calendar.dart';

import '../components/quit_box.dart';
import '../models/User.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key, required this.user});
  final User user;

  @override
  State<StatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  //Variable for days
  List<DateTime> days = [];

  @override
  void initState() {
    getDateTime();
    super.initState();
  }

  void getDateTime() {
    for (var dateInt in widget.user.daysEntered) {
      var day = DateTime.fromMillisecondsSinceEpoch(dateInt);
      days.add(DateTime(day.year, day.month, day.day));
    }
  }

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
            const Center(
                child: Icon(
              Icons.calendar_today,
              size: 50,
            )),
            //Text line
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Text(
                    "You can see the dates you\nlogged in.",
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
            //Streak Calender
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: CleanCalendar(
                startWeekday: WeekDay.monday,
                datesForStreaks: days,
                generalDatesProperties: DatesProperties(
                  datesDecoration: DatesDecoration(
                    datesBackgroundColor: Colors.red.shade100,
                    datesBorderColor: Colors.deepPurple.shade600,
                    datesBorderRadius: 1000,
                  ),
                ),
                streakDatesProperties: DatesProperties(
                  datesDecoration: DatesDecoration(
                    datesBackgroundColor: Colors.green.shade400,
                    datesBorderColor: Colors.deepPurple.shade600,
                    datesBorderRadius: 1000,
                  ),
                ),
                leadingTrailingDatesProperties: DatesProperties(
                  datesDecoration: DatesDecoration(
                    datesBorderRadius: 1000,
                    datesBorderColor: Colors.deepPurple.shade600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
