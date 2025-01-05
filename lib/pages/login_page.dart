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

  //Function for checking dates in the database for today's date.
  bool checkToday(User user) {
    final DateTime formattedToday =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    for (var day in user.daysEntered) {
      var date = DateTime.fromMillisecondsSinceEpoch(day);
      DateTime formattedDate = DateTime(date.year, date.month, date.day);

      //If today exist return true.
      if (formattedDate == formattedToday) {
        return true;
      }
    }
    //else return false
    return false;
  }

  //Function for updating the DateTime list of the user.
  Future<void> updateDateTime(List<int> days, User user) async {
    //String for the document Id
    String docId = "";

    //Query for getting the docId
    final query = await db
        .collection("users")
        .where("email", isEqualTo: user.email)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      docId = query.docs.first.id;
    }

    //Update in firestore
    await db.collection("users").doc(docId).update({"daysEntered": days});
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
        //boolean for checking if today exist in database.
        bool todayExist = checkToday(user);

        //If today is not in the database program will enter today to the database.
        if (!todayExist) {
          List<int> userDays = user.daysEntered;
          userDays.add(DateTime.now().millisecondsSinceEpoch);
          updateDateTime(userDays, user);
        }

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
