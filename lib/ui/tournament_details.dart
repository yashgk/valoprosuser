import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/app_colors.dart';
import 'package:valoprosuser/core/constant/app_style.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';

class TournamentDetails extends StatefulWidget {
  final String teamA;
  final String teamB;
  final String scoreA;
  final String scoreB;
  const TournamentDetails(
      {required this.teamA,
      required this.teamB,
      required this.scoreA,
      required this.scoreB,
      Key? key})
      : super(key: key);

  @override
  _TournamentDetailsState createState() => _TournamentDetailsState();
}

class _TournamentDetailsState extends State<TournamentDetails> {
  bool isLoading = false;
  CollectionReference teams = FirebaseFirestore.instance.collection('Teams');
  List teamAMembers = [];
  List teamBMembers = [];
  List<List<dynamic>> scoresA = [];
  List<List<dynamic>> scoresB = [];
  CollectionReference players =
      FirebaseFirestore.instance.collection('Players');

  Future getTeamMembers(String teamAName, String teamBName) async {
    setState(() {
      isLoading = true;
    });
    await teams.where('teamName', isEqualTo: teamAName).get().then((val) async {
      teamAMembers = val.docs.elementAt(0).get('players');
    });
    await teams.where('teamName', isEqualTo: teamBName).get().then((val) async {
      teamBMembers = val.docs.elementAt(0).get('players');
    });
    fetchScores();
    setState(() {
      isLoading = false;
    });
  }

  Future fetchScores() async {
    setState(() {
      isLoading = true;
    });

    for (int i = 0; i < teamAMembers.length; i++) {
      await players
          .where('playerName', isEqualTo: teamAMembers[i])
          .get()
          .then((value) async {
        var k = value.docs.elementAt(0).get('kills');
        var d = value.docs.elementAt(0).get('deaths');
        var a = value.docs.elementAt(0).get('assists');
        var asc = value.docs.elementAt(0).get('acs');
        List<dynamic> indScore = [];
        indScore.addAll([k, d, a, asc]);
        scoresA.add(indScore);
      });
    }
    for (int i = 0; i < teamBMembers.length; i++) {
      await players
          .where('playerName', isEqualTo: teamBMembers[i])
          .get()
          .then((value) async {
        var k = value.docs.elementAt(0).get('kills');
        var d = value.docs.elementAt(0).get('deaths');
        var a = value.docs.elementAt(0).get('assists');
        var asc = value.docs.elementAt(0).get('acs');
        List<dynamic> indScore = [];
        indScore.addAll([k, d, a, asc]);
        scoresB.add(indScore);
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getTeamMembers(widget.teamA, widget.teamB);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            body: Center(
              child: SizedBox(
                width: SizeConfig.screenWidth! * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: ExpansionTile(
                        childrenPadding: EdgeInsets.all(10),
                        initiallyExpanded: false,
                        backgroundColor: Colors.green,
                        collapsedBackgroundColor: Colors.green,
                        title: Text(
                          widget.teamA,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 21),
                        ),
                        children: <Widget>[
                          Container(
                            color: Colors.green.shade200,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Player',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'Agent',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'Kills/Deaths/Assist',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'ACS',
                                  style: AppStyles.blackSmall14,
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: teamAMembers.length,
                              itemBuilder: (context, index) {
                                var name = teamAMembers[index].toString();
                                return Container(
                                  color: AppColors.tomato,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          teamAMembers[index],
                                          style: AppStyles.blackSmall14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          'Boro',
                                          style: AppStyles.blackSmall14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Row(
                                          children: [
                                            Text(
                                              scoresA[index][0],
                                              style: AppStyles.blackSmall14,
                                            ),
                                            Text('/'),
                                            Text(
                                              scoresA[index][1],
                                              style: AppStyles.blackSmall14,
                                            ),
                                            Text('/'),
                                            Text(
                                              scoresA[index][2],
                                              style: AppStyles.blackSmall14,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 20,
                                        child: Text(
                                          scoresA[index][3],
                                          style: AppStyles.blackSmall14,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: ExpansionTile(
                        childrenPadding: EdgeInsets.all(10),
                        initiallyExpanded: false,
                        backgroundColor: Colors.green,
                        collapsedBackgroundColor: Colors.green,
                        title: Text(
                          widget.teamB,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 21),
                        ),
                        children: <Widget>[
                          Container(
                            color: Colors.green.shade200,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Player',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'Agent',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'Kills/Deaths/Assist',
                                  style: AppStyles.blackSmall14,
                                ),
                                Text(
                                  'ACS',
                                  style: AppStyles.blackSmall14,
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: teamAMembers.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: AppColors.tomato,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          teamBMembers[index],
                                          style: AppStyles.blackSmall14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          'Boro',
                                          style: AppStyles.blackSmall14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Row(
                                          children: [
                                            Text(
                                              scoresB[index][0],
                                              style: AppStyles.blackSmall14,
                                            ),
                                            Text('/'),
                                            Text(
                                              scoresB[index][1],
                                              style: AppStyles.blackSmall14,
                                            ),
                                            Text('/'),
                                            Text(
                                              scoresB[index][2],
                                              style: AppStyles.blackSmall14,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 20,
                                        child: Text(
                                          scoresB[index][3],
                                          style: AppStyles.blackSmall14,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
