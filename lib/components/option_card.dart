import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.option,
    required this.color,
  });

  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: (color.red != color.green) ? Colors.white : Colors.black,
                letterSpacing: .5,
                fontSize: 30),
          ),
        ),
      ),
    );
  }
}
