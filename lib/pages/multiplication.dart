// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/components/alert_box.dart';
import 'package:se380_project/pages/finishedPage.dart';
import '../models/User.dart';
import '../models/Question.dart';
import '../components/next_button.dart';
import '../components/option_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/result_box.dart';

class Multiplication extends StatefulWidget {
  const Multiplication({super.key, required this.user});

  final User user;

  @override
  State<StatefulWidget> createState() => _MultiplicationState();
}

class _MultiplicationState extends State<Multiplication> {
  //index for checking the question number
  int index = 0;
  //point counter
  int point = 0;
  //boolean for checking if the answer is already selected
  bool isSelected = false;
  //user object for changing it's point and multiIndex
  late User user;
  //db object for firebase
  final db = FirebaseFirestore.instance;
  //creating list of questions
  late List<Question> _questions = [];
  //bool for waiting data
  bool isLoading = true;
  //bool for checking if there is a question in the database
  bool questionsExist = true;

  @override
  void initState() {
    user = widget.user;
    getQuestions();
    super.initState();
  }

  Future<void> getQuestions() async {
    _questions = [];
    List<Question> questions = [];
    setState(() {
      isLoading = true;
    });

    final snapshot = await db
        .collection("multiQuestions")
        .where("id", isGreaterThanOrEqualTo: user.multiIndex + 1)
        .where("id", isLessThanOrEqualTo: user.multiIndex + 5)
        .get();

    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        questions.add(QuestionMapper.fromMap(doc.data()));
      }
    } else {
      questionsExist = false;
    }

    setState(() {
      isLoading = false;
      _questions = questions;
    });
    print(_questions);
  }

  //function to show the next question.
  void nextQuestion() {
    if (isSelected) {
      if (index != _questions.length - 1) {
        setState(() {
          index++;
          isSelected = false;
        });
      } else {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => ResultBox(
            color: Color(0xffDFAC60),
            result: point,
            questionLength: _questions.length,
            user: user,
            operationType: "multiplication",
          ),
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "Please select an answer!",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.orange,
        fontSize: 24,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  //function for changing the color
  void changeColorAndUpdate(bool value) {
    if (!isSelected) {
      if (value) {
        point++;
        setState(() {
          isSelected = true;
        });
        Fluttertoast.showToast(
          msg: "Correct Answer!\n+1 Points", // Message for the correct answer
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.green, // Optional: Change color for correct
          textColor: Colors.white,
          fontSize: 24,
          gravity: ToastGravity.CENTER, // Optional: Position of the toast
        );
      } else {
        setState(() {
          isSelected = true;
        });
        Fluttertoast.showToast(
          msg: "Wrong Answer!", // Message for the wrong answer
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red, // Optional: Change color for wrong
          textColor: Colors.white,
          fontSize: 24,
          gravity: ToastGravity.CENTER, // Optional: Position of the toast
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return !questionsExist
        ? FinishedPage(questionType: "multiplication", user: user)
        : Scaffold(
            backgroundColor: Color(0xffDFAC60),
            appBar: AppBar(
              //its using on second restart
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertBox(user: widget.user);
                    },
                  );
                },
              ),
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
                    "Point: $point",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              backgroundColor: Colors.deepPurple,
              elevation: 0,
              centerTitle: true,
            ),
            body: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Please select the correct answer!",
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 24)),
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
                                  'x',
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
                        for (int i = 0;
                            i < _questions[index].options.length;
                            i++)
                          GestureDetector(
                            onTap: () => changeColorAndUpdate(
                                _questions[index].options.values.toList()[i]),
                            child: OptionCard(
                              option:
                                  _questions[index].options.keys.toList()[i],
                              color: isSelected
                                  ? _questions[index].options.values.toList()[i]
                                      ? Color(0xff317832)
                                      : Color(0xffb82424)
                                  : Colors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
            floatingActionButton: !isLoading
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: NextButton(
                      nextQuestion: nextQuestion,
                    ),
                  )
                : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
