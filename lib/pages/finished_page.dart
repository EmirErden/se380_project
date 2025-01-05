import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    getVariables();
    super.initState();
  }

  void getVariables() {
    switch (widget.questionType) {
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
      case "division":
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
            const SizedBox(height: 120),
            SvgPicture.asset(
              'assets/icons/confetti.svg',
              width: 150,
              height: 125,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Text(
                "CONGRATULATIONS YOU SOLVED ALL QUESTIONS!",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      color: Colors.white, letterSpacing: .5, fontSize: 28,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Text(
                "You finished all of the $questionString questions.\n"
                    "New questions will be added soon. \n"
                    "Wait for the new update!",
                style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        color: Colors.white, letterSpacing: .5, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => FirstPage(user: widget.user)),
                  (Route<dynamic> route) => false,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Wraps to the content size
                  children: [
                    const Icon(Icons.home, color: Colors.black), // Add home icon
                    const SizedBox(width: 8), // Add some spacing between icon and text
                    Text(
                      "Return to main page",
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          letterSpacing: .5,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
