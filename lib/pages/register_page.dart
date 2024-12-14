import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/button.dart';
import '../components/text_field.dart';

import 'package:dio/dio.dart';

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

  final dio = Dio();

  void _validateAndSignUp() {
    String username = usernameTextController.text;
    String password = passwordTextController.text;
    String confirmPassword = confirmPasswordTextController.text;
    String email = emailTextController.text;

    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email)){
      print("Email is not valid. Try again.");
    } else if (password != confirmPassword) {
      print("Password's are not matching");
    }
    else {
      print("Registration is successfully done");
      postHttp(username, email, password);
    }
  }

  void getHttp() async {
    final response = await dio.get('https://se380project-d7026-default-rtdb.europe-west1.firebasedatabase.app/users.json');
    print(response.data);
  }

  void postHttp(String username, String email, String password) async {
    final response = await dio.post('https://se380project-d7026-default-rtdb.europe-west1.firebasedatabase.app/users.json', data: {"username": username, "email": email, "password": password});
    print(response.statusCode);
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
