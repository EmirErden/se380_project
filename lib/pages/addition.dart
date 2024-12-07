// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/question_model.dart';
import '../components/next_button.dart';
import '../components/option_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/result_box.dart';

class Addition extends StatefulWidget {
  const Addition({super.key});

  @override
  State<StatefulWidget> createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {
  final List<Question> _questions = [
    Question(
      id: '1',
      firstNumber: '25',
      secondNumber: '  5',
      options: {'5': false, '24': false, '30': true, '40': false},
    ),
    Question(
      id: '1',
      firstNumber: '12',
      secondNumber: '15',
      options: {'10': false, '17': false, '27': true, '22': false},
    )
  ];

  //index for checking the question number
  int index = 0;

  //score counter
  int score = 0;

  //boolean for checking if the answer is already selected
  bool isSelected = false;

  //function to show the next question.
  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => ResultBox(
          color: Color(0xffFE4F73),
          result: score,
          questionLength: _questions.length,
        ),
      );
    } else {
      if (isSelected) {
        setState(() {
          index++;
          isSelected = false;
        });
      } else {
        Fluttertoast.showToast(
          msg: "Please select an answer.",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          fontSize: 24,
          gravity: ToastGravity.CENTER,
        );
      }
    }
  }

  //function for changing the color
  void changeColorAndUpdate(bool value) {
    if (!isSelected) {
      if (value) {
        score++;
        setState(() {
          isSelected = true;
        });
      } else {
        setState(() {
          isSelected = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFE4F73),
      appBar: AppBar(
        title: Text(
          'Question ${index + 1}/${_questions.length}',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: Colors.white,
                letterSpacing: .5,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              "Score: $score",
              style: TextStyle(
                  color: Colors.white, letterSpacing: .5, fontSize: 18),
            ),
          ),
        ],
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please Select the correct answer",
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      color: Colors.white, letterSpacing: .5, fontSize: 24)),
            ),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 30),
                    Text(
                      _questions[index].firstNumber,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 60),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 60),
                      ),
                    ),
                    const SizedBox(width: 5),
                    // Space between operator and number
                    Text(
                      _questions[index].secondNumber,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 60),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Center(
              child: Container(
                height: 5,
                width: 150,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 100),
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => changeColorAndUpdate(
                    _questions[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  color: isSelected
                      ? _questions[index].options.values.toList()[i]
                          ? Color(0xff317832)
                          : Color(0xffb82424)
                      : Colors.white,
                ),
              )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
