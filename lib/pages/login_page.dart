import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/components/button.dart';
import 'package:se380_project/components/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade300,
      body: SafeArea(
        child: Center(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              //logo
              SvgPicture.asset(
                'assets/icons/paper.svg',
                width: 150,
                height: 125,
              ),
              const SizedBox(height: 30),
              //welcome message
              Text("Welcome back, you have been missed!",style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
               ),
              ),
              const SizedBox(height: 25),
              //email text field
              MyTextField(controller: emailTextController, hintText: 'Email', obscureText: false),
              //password text field
              const SizedBox(height: 10),
              MyTextField(controller: passwordTextController, hintText: 'Password', obscureText: true),
              const SizedBox(height: 20),
              //sign in button
              MyButton(onTap: () {}, text: 'Sign In'),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member? "),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: (){},
                    child: const Text(
                      "Register now! ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
