import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:se380_project/components/text_box.dart';
import '../models/User.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});

  final User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final db = FirebaseFirestore.instance;

  // edit field
  Future<void> editField(String field) async {
    String newValue = "";

    // Pre-fill the TextField with the current value
    if (field == 'username') {
      newValue = widget.user.username;
      usernameTextController.text = widget.user.username;
    } else if (field == 'password') {
      newValue = widget.user.password;
      passwordTextController.text = widget.user.password;
    } else if (field == 'email') {
      newValue = widget.user.email;
      emailTextController.text = widget.user.email;
    }

    // Show dialog to edit the field
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          controller: field == 'username'
              ? usernameTextController
              : field == 'password'
                  ? passwordTextController
                  : emailTextController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: const Text("Cancel", style: TextStyle(color: Colors.white)),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Save", style: TextStyle(color: Colors.white)),
            onPressed: () async {
              // Update the information in Firestore
              await updateInfo(field, newValue);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  // Update information in Firestore and local model
  Future<void> updateInfo(String field, String newValue) async {
    try {
      // Ensure a valid value is entered
      if (newValue.isEmpty) {
        _alertSnackBar("Field cannot be empty.");
        return;
      }
      // Document id of the user it will fill later
      String docId = "";

      //query for getting the document ID of the user
      final query = await db
          .collection("users")
          .where("email", isEqualTo: widget.user.email)
          .limit(1)
          .get();
      print(docId);

      if (query.docs.isNotEmpty) {
        docId = query.docs.first.id;
      }

      // Update in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(docId)
          .update({field: newValue});

      // Update in local model and UI
      setState(() {
        switch (field) {
          case 'username':
            widget.user.username = newValue;
            break;
          case 'password':
            widget.user.password = newValue;
            break;
          case 'email':
            widget.user.email = newValue;
            break;
        }
      });

      // Show a success message
      _showSnackBar("Information updated successfully");
    } catch (error) {
      print("Error updating information: $error"); // Log error for debugging
      // Show error message
      _alertSnackBar("Failed to update information");
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
        backgroundColor: const Color(0xfffffbf7),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.output_outlined, color: Colors.white),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/LoginOrRegister');
            },
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            'Profile Page',
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            //icon
            const Icon(
              LineIcons.userNinja,
              size: 78,
            ),
            //Details
            const SizedBox(height: 10),

            const Text(
              'My Details',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 20),

            //username
            MyTextBox(
              text: widget.user.username,
              sectionName: 'Username',
              onPressed: () => editField('username'),
            ),

            //password
            MyTextBox(
              text: widget.user.password,
              sectionName: 'Password',
              onPressed: () => editField('password'),
            ),

            //email
            MyTextBox(
              text: widget.user.email,
              sectionName: 'E-mail',
              onPressed: () => editField('email'),
            ),

            const SizedBox(height: 40),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: 0.7,
                    center: const Text(
                      "70.0%",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Total score",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: 0.5,
                    center: const Text(
                      "50.0%",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "XXX",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.cyan,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
