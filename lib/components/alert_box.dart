import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/models/User.dart';
import 'package:se380_project/pages/first_page.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({super.key, required this.user});

  final User user;
  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff191200),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                //ARE YOU SURE
                child: Text(
                  "Are you sure ?",
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        color: Colors.white, letterSpacing: .5, fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // YES
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => FirstPage(user: widget.user)),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Yes",
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          color: Colors.black, letterSpacing: .5, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // NO
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "No",
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          color: Colors.black, letterSpacing: .5, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
