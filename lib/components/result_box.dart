import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/pages/addition.dart';
import 'package:se380_project/pages/first_page.dart';

import '../models/User.dart';
import '../pages/division.dart';
import '../pages/extraction.dart';
import '../pages/multiplication.dart';

class ResultBox extends StatefulWidget {
  const ResultBox(
      {super.key,
      required this.color,
      required this.result,
      required this.questionLength,
      required this.user,
      required this.operationType});

  final Color color;
  final int result;
  final int questionLength;
  final User user;
  final String operationType;

  @override
  State<StatefulWidget> createState() => _ResultBoxState();
}

class _ResultBoxState extends State<ResultBox> {
  //Firebase connection
  final db = FirebaseFirestore.instance;
  //bool variable for loading screen
  bool isLoading = true;

  Future<void> changeUserData() async {
    //setState for make isLoading true
    setState(() {
      isLoading = true;
    });

    //variable for docID
    String docId = "";

    //query for getting the document ID;
    final query = await db
        .collection("users")
        .where("email", isEqualTo: widget.user.email)
        .limit(1)
        .get();
    if (query.docs.isNotEmpty) {
      docId = query.docs.first.id;
    }
    await db
        .collection("users")
        .doc(docId)
        .update({"totalQuestions": widget.user.totalQuestions + 5});
    widget.user.totalQuestions += 5;

    //Query for changing the user data and changing in app user data
    switch (widget.operationType) {
      case "addition":
        await db.collection("users").doc(docId).update({
          "score": widget.user.score + widget.result,
          "addIndex": widget.user.addIndex + 5,
        });
        widget.user.score += widget.result;
        widget.user.addIndex += 5;
        break;
      case "extraction":
        await db.collection("users").doc(docId).update({
          "score": widget.user.score + widget.result,
          "extIndex": widget.user.extIndex + 5
        });
        widget.user.score += widget.result;
        widget.user.extIndex += 5;
        break;
      case "multiplication":
        await db.collection("users").doc(docId).update({
          "score": widget.user.score + widget.result,
          "multiIndex": widget.user.multiIndex + 5
        });
        widget.user.score += widget.result;
        widget.user.multiIndex += 5;
        break;
      case "division":
        await db.collection("users").doc(docId).update({
          "score": widget.user.score + widget.result,
          "divIndex": widget.user.divIndex + 5
        });
        widget.user.score += widget.result;
        widget.user.divIndex += 5;
        break;
    }

    //changing the user inside of the app
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    changeUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : AlertDialog(
            backgroundColor: widget.color,
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
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 28),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: widget.result == widget.questionLength / 2
                        ? Colors.yellow
                        : widget.result < widget.questionLength / 2
                            ? Colors.red
                            : Colors.green,
                    child: Center(
                      child: Text(
                        '${widget.result}/${widget.questionLength}',
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      widget.result == widget.questionLength / 2
                          ? 'Almost There!'
                          : widget.result < widget.questionLength / 2
                              ? 'Work Harder!'
                              : 'Good Job!',
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 24),
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
                            builder: (context) => FirstPage(user: widget.user)),
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
                      // Widget içinde bir değere göre yönlendirme yap
                      Widget nextPage;
                      switch (widget.operationType) {
                        case 'addition':
                          nextPage = Addition(user: widget.user);
                          break;
                        case 'extraction':
                          nextPage = Extraction(user: widget.user);
                          break;
                        case 'multiplication':
                          nextPage = Multiplication(user: widget.user);
                          break;
                        case 'division':
                          nextPage = Division(user: widget.user);
                          break;
                        default:
                          nextPage = Addition(user: widget.user);
                      }

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => nextPage,
                        ),
                        (Route<dynamic> route) =>
                            false, // Geri dönüş yığınını temizler
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
