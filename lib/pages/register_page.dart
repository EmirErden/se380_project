import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/models/User.dart';

import '../components/button.dart';
import '../components/text_field.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final usernameTextController = TextEditingController();

  final db = FirebaseFirestore.instance;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _validateAndSignUp() {
    String username = usernameTextController.text;
    String password = passwordTextController.text;
    String confirmPassword = confirmPasswordTextController.text;
    String email = emailTextController.text;

    if (!RegExp('[a-zA-Z0-9]').hasMatch(username)) {
      _alertSnackBar("Username is not valid. Try again!");
    } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email)) {
      _alertSnackBar("Email is not valid. Try again!");
    } else if (password != confirmPassword) {
      _alertSnackBar("Password's are not matching!");
    } else {
      _showSnackBar("Registration is successfully done");
      addUser(username, email, password);
      //it should be push to home page
      Navigator.pushNamed(context, '/LoginOrRegister');
    }
  }

  Future<void> addUser(String username, String email, String password) async {
    await db.collection("users").add(User(username, email, password, 0, 0, 0, 0,
            0, 0, [DateTime.now().millisecondsSinceEpoch], "bear.svg")
        .toMap());
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
                const SizedBox(height: 60),
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
                )),
                const SizedBox(height: 50),
                //logo
                SvgPicture.asset(
                  'assets/icons/paper.svg',
                  width: 150,
                  height: 125,
                ),
                const SizedBox(height: 30),
                //welcome message
                Center(
                  child: Text(
                    "Let's create an account!",
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
                //username
                MyTextField(
                  controller: usernameTextController,
                  hintText: 'Username',
                  obscureText: false,
                  toggleVisibility: null,
                  showPassword: false,
                ),
                //email text field
                const SizedBox(height: 15),
                MyTextField(
                    controller: emailTextController,
                    hintText: 'Email',
                    obscureText: false,
                    toggleVisibility: null,
                    showPassword: false),
                //password text field
                const SizedBox(height: 15),
                MyTextField(
                    controller: passwordTextController,
                    hintText: 'Password',
                    obscureText: _obscurePassword,
                    toggleVisibility: _togglePasswordVisibility,
                    showPassword: !_obscurePassword),
                //confirm password text field
                const SizedBox(height: 15),
                MyTextField(
                    controller: confirmPasswordTextController,
                    hintText: 'Confirm Password',
                    obscureText: _obscureConfirmPassword,
                    toggleVisibility: _toggleConfirmPasswordVisibility,
                    showPassword: !_obscureConfirmPassword),
                const SizedBox(height: 25),
                //sign in button
                MyButton(onTap: _validateAndSignUp, text: 'Sign up'),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have a account? "),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login now! ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
