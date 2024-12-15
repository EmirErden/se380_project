import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/pages/addition.dart';
import 'package:se380_project/pages/first_page.dart';

import '../models/User.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key,
      required this.color,
      required this.result,
      required this.questionLength,
      required this.user});

  final Color color;
  final int result;
  final int questionLength;
  final User user;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: color,
      content: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Result",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      color: Colors.white, letterSpacing: .5, fontSize: 28),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? Colors.red
                      : Colors.green,
              child: Center(
                child: Text(
                  '$result/$questionLength',
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        color: Colors.black, letterSpacing: .5, fontSize: 24),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                result == questionLength / 2
                    ? 'Almost There!'
                    : result < questionLength / 2
                        ? 'Work Harder!'
                        : 'Good Job!',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      color: Colors.white, letterSpacing: .5, fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => FirstPage(user: user)),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.home),
                /*Text("Back to home",
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
                  ),
                  ),
                   */
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => Addition(user: user),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.restart_alt_outlined),
              ),
              /*Text("Continue solving",
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
              ),
              ),
              */
            ),
          ],
        ),
      ),
    );
  }
}
