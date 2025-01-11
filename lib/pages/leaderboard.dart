import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  //Firestore instance
  final db = FirebaseFirestore.instance;
  //Our leaderboardData variable declaration
  List<Map<String, dynamic>> leaderboardData = [];
  //Variable choosing which column to sort. Default Points
  int _sortColumnIndex = 4;
  //Variable for waiting the firebase
  bool isLoading = true;

  @override
  void initState() {
    getUserList();
    super.initState();
  }

  Future<void> getUserList() async {
    setState(() {
      isLoading = true;
    });
    //Getting every user inside of the collection
    final query = await db.collection("users").get();

    //If query is not empty It will add every user to it
    if (query.docs.isNotEmpty) {
      for (int a = 0; a < query.docs.length; a++) {
        var user = UserMapper.fromMap(query.docs[a].data());

        //Little calculations for the trailing numbers after the double
        double percent = 0.0;
        if (user.score == 0 && user.totalQuestions == 0) {
          percent = 0.0;
        } else {
          percent = user.score / user.totalQuestions;
        }
        String formattedPercent = percent.toStringAsFixed(2);
        double formattedDouble = double.parse(formattedPercent);

        //Adding values to the leaderboardData
        leaderboardData.add({
          "Username": user.username,
          "Questions": user.totalQuestions,
          "Percent": formattedDouble,
          "Points": user.score
        });
      }

      //Sort data before putting is inside of the DataTable
      leaderboardData.sort((a, b) => b['Points'].compareTo(a['Points']));
    } else {}
    setState(() {
      isLoading = false;
    });
  }

  void sortData(int columnIndex) {
    setState(() {
      _sortColumnIndex = columnIndex;
      switch (columnIndex) {
        case 2: // totalQuestions
          leaderboardData
              .sort((a, b) => b['Questions'].compareTo(a['Questions']));
          break;
        case 3: // Percent
          leaderboardData.sort((a, b) => b['Percent'].compareTo(a['Percent']));
          break;
        case 4: // Points
          leaderboardData.sort((a, b) => b['Points'].compareTo(a['Points']));
          break;
        default:
          break;
      }
    });
  }

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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/trophy.svg',
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        "List Of Players!",
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/trophy.svg',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      sortColumnIndex: _sortColumnIndex,
                      sortAscending: false,
                      columnSpacing: 12,
                      columns: [
                        const DataColumn(
                            label: Center(child: Text("Rank")), onSort: null),
                        const DataColumn(
                            label: Center(child: Text("Username")),
                            onSort: null),
                        DataColumn(
                          label: const Center(child: Text("TotalQuestions")),
                          numeric: true,
                          onSort: (index, _) => sortData(index),
                        ),
                        DataColumn(
                          label: const Center(child: Text("Percent")),
                          numeric: true,
                          onSort: (index, _) => sortData(index),
                        ),
                        DataColumn(
                          label: const Center(child: Text("Points")),
                          numeric: true,
                          onSort: (index, _) => sortData(index),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        leaderboardData.length,
                        (index) {
                          final user = leaderboardData[index];
                          Color rowColor;
                          if (index == 0) {
                            rowColor = Colors.amber.shade300;
                          } else if (index == 1) {
                            rowColor = Colors.grey.shade400;
                          } else if (index == 2) {
                            rowColor = Colors.brown.shade300;
                          } else {
                            rowColor = Colors.deepPurple.shade200;
                          }
                          return DataRow(
                            color: WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) => rowColor,
                            ),
                            cells: [
                              DataCell(Center(child: Text('${index + 1}'))),
                              DataCell(Center(child: Text(user['Username']))),
                              DataCell(
                                  Center(child: Text('${user['Questions']}'))),
                              DataCell(
                                  Center(child: Text('${user['Percent']}'))),
                              DataCell(
                                  Center(child: Text('${user["Points"]}'))),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
