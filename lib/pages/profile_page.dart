// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/components/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //user
  //final currentUser = FirebaseAuth.instance.currentUser!;

  //all users
  //final usersCollection = FirebaseFirestore.instance.collection("Users");

  //edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Edit " + field,
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onChanged: (value){
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

    //update in firestore
    /*if(newValue.trim().length > 0){
      //only update if there is something in textfield
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }*/


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffffbf7),
        appBar: AppBar(
          title: Text('Profile page', style: GoogleFonts.nunito(textStyle: TextStyle(color: Colors.white,letterSpacing: .5,fontSize: 24,fontWeight: FontWeight.bold),),),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          centerTitle: true,
        ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          //icon
          Icon(
            Icons.person,
            size: 72,
          ),
          //Details
          SizedBox(height: 20),

          Text(
            'My Details',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),

          //user name
          MyTextBox(
              text: 'utkuhan ergene',
              sectionName: 'Username',
              onPressed:() => editField('username'),
          ),

          //password
          MyTextBox(
            text: 'asdasdasdaskldas',
            sectionName: 'Password',
            onPressed:() => editField('password'),
          ),

          //email
          MyTextBox(
            text: 'utkuhanergene7@gmail.com',
            sectionName: 'E-mail',
            onPressed:() => editField('email'),
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
            onPressed:() => editField('birth'),
          ),



        ],
      )
    );
  }
}
