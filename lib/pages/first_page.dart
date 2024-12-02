// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se380_project/pages/home.dart';
import 'package:se380_project/pages/profile_page.dart';
import 'package:se380_project/pages/settings_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // this integer keeps track of the current page
  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    //home page
    HomePage(),
    //profile page
    ProfilePage(),
    //settings page
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: [
            //home
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
            //profile
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile',),
            //settings
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',),
          ],
      ),
    );
  }
}
