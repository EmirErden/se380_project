// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:se380_project/components/text_box.dart';

import '../models/User.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});

  final User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          //cancel button
          TextButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),

          //save button
          TextButton(
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffffbf7),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.output_outlined, color: Colors.white),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/LoginOrRegister');
            },
          ),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            'Profile Page',
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
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
            SizedBox(
              height: 50,
            ),
            //icon
            Icon(
              LineIcons.userNinja,
              size: 78,
            ),
            //Details
            SizedBox(height: 10),

            Text(
              'My Details',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 20),

            //user name
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

            //phone number
            /*MyTextBox(
            text: '531 615 56 50',
            sectionName: 'Phone Number',
            onPressed:() => editField('phone'),
          ),*/

            //birth day
            MyTextBox(
              text: '26/05/2003',
              sectionName: 'Birth Day',
              onPressed: () => editField('birth'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
