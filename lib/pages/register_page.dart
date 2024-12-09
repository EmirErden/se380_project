import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/button.dart';
import '../components/text_field.dart';

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

  void _validateAndSignUp() {
    String password = passwordTextController.text;
    String confirmPassword = confirmPasswordTextController.text;

    if (password == confirmPassword) {
      print("Registration is successfully done");
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade300,
        body: SafeArea(
          child: Center(
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  const SizedBox(height: 60),
                  Center(child: Text('Math Ninja', style: GoogleFonts.nunito(textStyle: const TextStyle(color: Colors.black,letterSpacing: .5,fontSize: 34,fontWeight: FontWeight.bold),),)),
                  const SizedBox(height: 50),
                  //logo
                  SvgPicture.asset(
                    'assets/icons/paper.svg',
                    width: 150,
                    height: 125,
                  ),
                  const SizedBox(height: 30),
                  //welcome message
                  Text("Let's create an account!",style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  ),
                  const SizedBox(height: 25),
                  //username
                  MyTextField(controller: usernameTextController, hintText: 'Username', obscureText: false),
                  //email text field
                  const SizedBox(height: 15),
                  MyTextField(controller: emailTextController, hintText: 'Email', obscureText: false),
                  //password text field
                  const SizedBox(height: 15),
                  MyTextField(controller: passwordTextController, hintText: 'Password', obscureText: true),
                  //confirm password text field
                  const SizedBox(height: 15),
                  MyTextField(controller: confirmPasswordTextController, hintText: 'Confirm Password', obscureText: true),
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
        )
    );
  }
}
