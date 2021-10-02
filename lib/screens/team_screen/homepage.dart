import 'package:valoprosuser/screens/team_screen/matches_nav.dart';
import 'package:valoprosuser/screens/team_screen/players_nav.dart';
import 'package:valoprosuser/screens/team_screen/teams.dart';
import 'package:flutter/material.dart';


class PlayerHomeScreen extends StatefulWidget {
  const PlayerHomeScreen({Key? key}) : super(key: key);

  @override
  _PlayerHomeScreenState createState() =>  _PlayerHomeScreenState();
}

class  _PlayerHomeScreenState extends State<PlayerHomeScreen> {
  // ignore: unused_field

  int _currentIndex = 0;
  set currentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const PlayersScreen(),
          const TeamsScreen(),
          MatchesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => currentIndex = index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Players",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Teams"),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart), label: "Matches"),
        ],
      ),
    );
  }
}
