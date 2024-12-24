import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/components/button.dart';
import 'package:se380_project/components/text_field.dart';
import 'package:se380_project/models/Question.dart';
import 'package:se380_project/models/User.dart';
import 'package:se380_project/pages/first_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool _obscurePassword = true;

  final db = FirebaseFirestore.instance;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  //Function for adding questions to the firebase. Will be deleted later
  Future<void> addQuestions() async {
    try {
      await db.collection("divQuestions").doc("1").set(Question(
            id: 1,
            firstNumber: '6',
            secondNumber: '  2',
            options: {'3': true, '4': false, '5': false, '6': false},
          ).toMap());

      await db.collection("divQuestions").doc("2").set(Question(
            id: 2,
            firstNumber: '9',
            secondNumber: '  3',
            options: {'3': false, '4': true, '5': false, '6': false},
          ).toMap());

      await db.collection("divQuestions").doc("3").set(Question(
            id: 3,
            firstNumber: '12',
            secondNumber: '  4',
            options: {'2': false, '3': false, '4': true, '5': false},
          ).toMap());

      await db.collection("divQuestions").doc("4").set(Question(
            id: 4,
            firstNumber: '15',
            secondNumber: '  3',
            options: {'4': false, '5': false, '6': true, '7': false},
          ).toMap());

      await db.collection("divQuestions").doc("5").set(Question(
            id: 5,
            firstNumber: '20',
            secondNumber: '  4',
            options: {'5': false, '6': false, '7': false, '4': true},
          ).toMap());

      await db.collection("divQuestions").doc("6").set(Question(
            id: 6,
            firstNumber: '18',
            secondNumber: '  6',
            options: {'3': true, '4': false, '2': false, '5': false},
          ).toMap());

      await db.collection("divQuestions").doc("7").set(Question(
            id: 7,
            firstNumber: '24',
            secondNumber: '  8',
            options: {'3': false, '4': false, '5': false, '6': true},
          ).toMap());

      await db.collection("divQuestions").doc("8").set(Question(
            id: 8,
            firstNumber: '30',
            secondNumber: '  6',
            options: {'4': false, '5': true, '6': false, '7': false},
          ).toMap());

      await db.collection("divQuestions").doc("9").set(Question(
            id: 9,
            firstNumber: '45',
            secondNumber: '  9',
            options: {'4': false, '5': false, '6': true, '7': false},
          ).toMap());

      await db.collection("divQuestions").doc("10").set(Question(
            id: 10,
            firstNumber: '48',
            secondNumber: '  6',
            options: {'7': false, '8': true, '9': false, '10': false},
          ).toMap());

      print("succesfully addded the question.");
    } catch (e) {
      print("Error adding data: $e");
    }
  }

  Future<void> signIn() async {
    String email = emailTextController.text;
    String password = passwordTextController.text;

    final snapshot = await db
        .collection("users")
        .where("email", isEqualTo: email)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      var doc = snapshot.docs.first;

      final User user = UserMapper.fromMap(doc.data());

      if (user.password == password) {
        _showSnackBar("Successfully signed in!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirstPage(user: user),
          ),
        );
      } else {
        _alertSnackBar("Password and E-mail is not matching!");
      }
    } else {
      _alertSnackBar("No user found with this email!");
    }
  }

  void _alertSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red.shade600,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar); // shows snack bar
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar); // shows snack bar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade300,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Text(
                      'Math Ninja',
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            letterSpacing: .5,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  //logo
                  SvgPicture.asset(
                    'assets/icons/signs.svg',
                  ),
                  const SizedBox(height: 35),
                  //welcome message
                  Center(
                    child: Text(
                      "Welcome back, we missed you!",
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  //email text field
                  MyTextField(
                    controller: emailTextController,
                    hintText: 'Email',
                    obscureText: false,
                    toggleVisibility: null,
                    showPassword: false,
                  ),
                  //password text field
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordTextController,
                    hintText: 'Password',
                    obscureText: _obscurePassword,
                    toggleVisibility: _togglePasswordVisibility,
                    showPassword: !_obscurePassword,
                  ),
                  //forgot password?
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Color(0xff636363),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  //sign in button
                  MyButton(onTap: signIn, text: 'Sign In'),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: addQuestions, child: Text("Add Questions")),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  //register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not a member? ",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Register now! ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
