import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:se380_project/components/quit_box.dart';
import 'package:se380_project/components/text_box.dart';
import '../models/User.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});

  final User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Controllers for getting the variables
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  //Firestore instance
  final db = FirebaseFirestore.instance;
  //Percent and percent string for the score
  double percent = 0;
  String percentString = "";
  //Variable for selected profile picture
  String _selectedProfilePicture = "bear.svg";
  //Variable for loading the page
  bool isLoading = false;

  //List of profilePictures
  final List<String> _profilePictures = [
    "bear.svg",
    "boar.svg",
    "cow.svg",
    "crab.svg",
    "crocodile.svg",
    "dinosaur.svg",
    "elk.svg",
    "fox.svg",
    "hedgehog.svg",
    "jellyfish.svg",
    "lion.svg",
    "penguin.svg",
    "polar-bear.svg",
    "rabbit.svg",
    "raccoon.svg",
    "shrimp.svg",
    "whale.svg",
    "zebra.svg",
  ];

  @override
  void initState() {
    calculatePercentages();
    getUserProfilePicture();
    super.initState();
  }

  //Function for getting the user's profile picture
  void getUserProfilePicture() {
    _selectedProfilePicture = widget.user.profilePicture;
  }

  Future<void> changeProfilePicture(String profilePic) async {
    try {
      setState(() {
        isLoading = true;
      });

      //document id of the user
      String docId = "";

      //query for getting the document id
      final query = await db
          .collection("users")
          .where("email", isEqualTo: widget.user.email)
          .limit(1)
          .get();
      if (query.docs.isNotEmpty) {
        docId = query.docs.first.id;
      }
      //Changing the information inside of the firestore
      await db
          .collection("users")
          .doc(docId)
          .update({"profilePicture": profilePic});

      //setState for changing info inside of the program and making isLoading false
      setState(() {
        _selectedProfilePicture = profilePic;
        widget.user.profilePicture = profilePic;
        isLoading = false;
      });
      //Show user a success message
      _showSnackBar("Profile picture updated successfully!");
    } catch (e) {
      _alertSnackBar("Failed to update the information");
    }
  }

  void calculatePercentages() {
    print(_selectedProfilePicture);
    if (widget.user.score == 0 && widget.user.totalQuestions == 0) {
      percent = 0.0;
    } else {
      percent = widget.user.score / widget.user.totalQuestions;
    }
    String formattedPercent = percent.toStringAsFixed(2);
    double formattedDouble = double.parse(formattedPercent);
    percentString = "${formattedDouble * 100}%";
  }

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

      if (query.docs.isNotEmpty) {
        docId = query.docs.first.id;
      }

      // Update in Firestore
      await db.collection('users').doc(docId).update({field: newValue});

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

  void _showImageSelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Select a new Profile Picture",
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        letterSpacing: .5,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _profilePictures.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              changeProfilePicture(_profilePictures[index]);
                            });
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            "assets/profilePictures/${_profilePictures[index]}",
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: const Color(0xfffffbf7),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.output_outlined, color: Colors.white),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return QuitBox(user: widget.user);
                    },
                  );
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
                //ico
                GestureDetector(
                  onTap: _showImageSelector,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      // Profile Picture
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade200,
                        child: SvgPicture.asset(
                          "assets/profilePictures/$_selectedProfilePicture",
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.all(8.0), // Adjust the padding as needed
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 24, // Adjust size of the pen icon as needed
                        ),
                      ),
                    ],
                  ),
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: percent,
                    center: Text(
                      percentString,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Total score",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                  ),
                ),
              ],
            ));
  }
}
