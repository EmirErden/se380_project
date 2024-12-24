import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/auth/login_or_register.dart';
import 'package:se380_project/models/User.dart';
import 'package:se380_project/pages/first_page.dart';

class QuitBox extends StatefulWidget {
  const QuitBox( {super.key, required this.user});

  final User user;

  @override
  State<QuitBox> createState() => _QuitBoxState();
}

class _QuitBoxState extends State<QuitBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff191200),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 35),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                //ARE YOU SURE
                child: Text(
                  "Do you want to exit ?",
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // YES
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginOrRegister()),
                        (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Yes",
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // NO
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => FirstPage(user: widget.user),
                    ),
                        (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("No",
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
