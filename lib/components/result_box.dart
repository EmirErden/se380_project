import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Result",
              style: TextStyle(
                  color: Colors.white, letterSpacing: .5, fontSize: 28),
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
                style: const TextStyle(
                    color: Colors.white, letterSpacing: .5, fontSize: 24),
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
              style: const TextStyle(
                  color: Colors.white, letterSpacing: .5, fontSize: 24),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Back to Menu',
                style: TextStyle(
                    color: Colors.deepOrange, letterSpacing: .5, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
