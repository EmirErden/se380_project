import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key,
      required this.color,
      required this.result,
      required this.questionLength});

  final Color color;
  final int result;
  final int questionLength;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: color,
      content: Padding(
        padding: const EdgeInsets.all(70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Result",
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(color: Colors.white, letterSpacing: .5, fontSize: 28),
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
              child: Text(
                '$result/$questionLength',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              result == questionLength / 2
                  ? 'Almost There!'
                  : result < questionLength / 2
                      ? 'Work Harder!'
                      : 'Good Job!',
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(color: Colors.white, letterSpacing: .5, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/HomePage', (Route<dynamic> route) => false,
                  );
                },
                child: Text("Back to the home page",
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
                ),
                ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/Addition', (Route<dynamic> route) => false,
                );
              },
              child: Text("Continue Solving ",
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
