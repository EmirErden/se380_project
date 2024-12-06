import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/components/button.dart';
import 'package:se380_project/components/square_tile.dart';
import 'package:se380_project/components/text_field.dart';

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
              Text('Math Ninja', style: GoogleFonts.nunito(textStyle: const TextStyle(color: Colors.black,letterSpacing: .5,fontSize: 34,fontWeight: FontWeight.bold),),),
              const SizedBox(height: 35),
              //logo
              SvgPicture.asset(
                'assets/icons/signs.svg',
              ),
              const SizedBox(height: 35),
              //welcome message
              Text("Welcome back, we missed you!",style: GoogleFonts.nunito(
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
              //forgot password?
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password?',
                      style: TextStyle(color: Color(0xff636363),fontWeight: FontWeight.bold,fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              //sign in button
              MyButton(onTap: () {}, text: 'Sign In'),
              const SizedBox(height: 30),
              //or continue with
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Expanded(child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      ),
                    ),
                    Text('  Or continue with  ',style: TextStyle(color: Colors.black,),),
                    Expanded(child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              //google + apple sign in buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'lib/images/google.png'),
                  SizedBox(width: 50),
                  //apple button
                  SquareTile(imagePath: 'lib/images/apple.png',),
                ],
              ),
              const SizedBox(height: 40),
              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member? ",style: TextStyle(fontSize: 14),),
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
      )
    );
  }
}
