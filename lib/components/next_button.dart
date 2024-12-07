import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.nextQuestion});

  final VoidCallback nextQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: const Text(
          "Next Question",
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
        ),
      ),
    );
  }
}
