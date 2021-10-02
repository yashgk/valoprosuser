import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';
import 'package:valoprosuser/ui/tournament_details.dart';
import 'package:valoprosuser/ui/widgets/match_tile.dart';

class TournamentScreen extends StatefulWidget {
  const TournamentScreen({Key? key}) : super(key: key);

  @override
  _TournamentScreenState createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  bool isLoading = false;
  List<String> tournamentList = [];
  List<List<dynamic>> teamList = [];
  List<Map<dynamic, dynamic>> scoreList = [];
  CollectionReference tournaments =
      FirebaseFirestore.instance.collection('Tournaments');
  void getTournaments() async {
    setState(() {
      isLoading = true;
    });
    await tournaments.get().then((value) async {
      for (int i = 0; i < value.size; i++) {
        tournamentList.add(value.docs.elementAt(i).get('tournamentName'));
        List<dynamic> team = value.docs.elementAt(i).get('teams') ?? [];
        Map score = value.docs.elementAt(i).get('scores');
        scoreList.add(score);
        teamList.add(team);
      }
    });

    print(teamList);
    print(scoreList);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getTournaments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/bg2.jpg'))),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: tournamentList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return TournamentDetails(
                                teamA: teamList[index][0],
                                scoreA: scoreList[index][teamList[index][0]],
                                teamB: teamList[index][1],
                                scoreB: scoreList[index][teamList[index][1]],
                              );
                            });
                      },
                      child: MatchTile(
                        teamA: teamList[index][0],
                        scoreA: scoreList[index][teamList[index][0]],
                        teamB: teamList[index][1],
                        scoreB: scoreList[index][teamList[index][1]],
                      ),
                    );
                  })),
    );
  }
}
