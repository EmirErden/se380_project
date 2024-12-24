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
      await db.collection("extQuestions").doc("1").set(Question(
            id: 1,
            firstNumber: '15',
            secondNumber: '  5',
            options: {'10': true, '11': false, '9': false, '12': false},
          ).toMap());

      await db.collection("extQuestions").doc("2").set(Question(
            id: 2,
            firstNumber: '18',
            secondNumber: '  8',
            options: {'9': false, '10': true, '11': false, '12': false},
          ).toMap());

      await db.collection("extQuestions").doc("3").set(Question(
            id: 3,
            firstNumber: '20',
            secondNumber: '  7',
            options: {'12': false, '13': false, '14': false, '13': true},
          ).toMap());

      await db.collection("extQuestions").doc("4").set(Question(
            id: 4,
            firstNumber: '25',
            secondNumber: '10',
            options: {'14': false, '13': false, '15': true, '16': false},
          ).toMap());

      await db.collection("extQuestions").doc("5").set(Question(
            id: 5,
            firstNumber: '30',
            secondNumber: '12',
            options: {'20': false, '19': false, '17': false, '18': true},
          ).toMap());

      await db.collection("extQuestions").doc("6").set(Question(
            id: 6,
            firstNumber: '35',
            secondNumber: '15',
            options: {'21': false, '22': false, '20': true, '19': false},
          ).toMap());

      await db.collection("extQuestions").doc("7").set(Question(
            id: 7,
            firstNumber: '40',
            secondNumber: '20',
            options: {'19': false, '20': true, '21': false, '22': false},
          ).toMap());

      await db.collection("extQuestions").doc("8").set(Question(
            id: 8,
            firstNumber: '50',
            secondNumber: '25',
            options: {'27': false, '26': false, '25': true, '24': false},
          ).toMap());

      await db.collection("extQuestions").doc("9").set(Question(
            id: 9,
            firstNumber: '60',
            secondNumber: '30',
            options: {'32': false, '30': true, '29': false, '31': false},
          ).toMap());

      await db.collection("extQuestions").doc("10").set(Question(
            id: 10,
            firstNumber: '70',
            secondNumber: '35',
            options: {'34': false, '35': true, '36': false, '37': false},
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
