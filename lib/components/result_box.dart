import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/pages/addition.dart';
import 'package:se380_project/pages/first_page.dart';

import '../models/User.dart';

class ResultBox extends StatefulWidget {
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
        .where("email", isEqualTo: "emirerden123@gmail.com")
        .limit(1)
        .get();
    if (query.docs.isNotEmpty) {
      docId = query.docs.first.id;
    } else {
      print("user is not found");
    }

    //Query for changing the user data
    await db.collection("users").doc(docId).update({
      "score": widget.user.score + widget.result,
      "addIndex": widget.user.addIndex + 5
    });

    //changing the user inside of the app
    widget.user.score += widget.result;
    widget.user.addIndex += 5;

    setState(() {
      isLoading = false;
    });
    print(widget.user);
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
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => Addition(user: widget.user),
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
