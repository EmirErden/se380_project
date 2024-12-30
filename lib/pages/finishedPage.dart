import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/pages/first_page.dart';

import '../models/User.dart';

class FinishedPage extends StatefulWidget {
  const FinishedPage(
      {super.key, required this.questionType, required this.user});

  final String questionType;
  final User user;

  @override
  State<StatefulWidget> createState() => _FinishedPageState();
}

class _FinishedPageState extends State<FinishedPage> {
  String questionString = "";
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    getVariables(widget.questionType);
    super.initState();
  }

  void getVariables(String widget) {
    switch (widget) {
      case "addition":
        backgroundColor = const Color(0xffFE4F73);
        questionString = "addition";
        break;
      case "extraction":
        backgroundColor = const Color(0xff468AB8);
        questionString = "extraction";
        break;
      case "multiplication":
        backgroundColor = const Color(0xffDFAC60);
        questionString = "multiplication";
        break;
      case "Division":
        backgroundColor = const Color(0xff30C562);
        questionString = "division";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => FirstPage(user: widget.user)),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: Text(
          "Math Ninja",
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
                color: Colors.white,
                letterSpacing: .5,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Text(
              "CONGRATULATIONS!",
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                    color: Colors.white, letterSpacing: .5, fontSize: 32),
              ),
            ),
            const SizedBox(height: 60),
            Text(
              "You finished all of the $questionString questions",
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      color: Colors.white, letterSpacing: .5, fontSize: 24)),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => FirstPage(user: widget.user)),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text(
                "Return to Main Page",
                style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        color: Colors.black, letterSpacing: .5, fontSize: 24)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
