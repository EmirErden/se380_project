import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/quit_box.dart';
import '../models/User.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key, required this.user});
  final User user;

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffbf7),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.output_outlined,
            color: Colors.white,
          ),
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
          color: Colors.white,
        ),
        title: Text(
          'Leaderboard',
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "List Of Best Players!",
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(
                  index.toString(),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
