// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:se380_project/pages/home.dart';
import 'package:se380_project/pages/profile_page.dart';
import 'package:se380_project/pages/schedule_page.dart';

import '../models/User.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.user});

  final User user;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // this integer keeps track of the current page
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      //home page
      HomePage(user: widget.user),
      //profile page
      ProfilePage(user: widget.user),
      //settings page
      SchedulePage(user: widget.user),
    ];
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade500,
        body: _pages[_selectedIndex],
        /*bottomNavigationBar: BottomNavigationBar(
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
      ),*/
        bottomNavigationBar: GNav(
            onTabChange: (selectedIndex) {
              _navigateBottomBar(selectedIndex);
            },
            backgroundColor: Colors.white,
            haptic: true, // haptic feedback
            tabBorderRadius: 30,
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 400), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey.shade800, // unselected icon color
            activeColor: Colors.purple, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
                Color(0xffe1c4ff), // selected tab background color
            padding: EdgeInsets.all(20), // navigation bar padding
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
              GButton(
                icon: LineIcons.calendar,
                text: 'Schedule',
              ),
            ]));
  }
}
