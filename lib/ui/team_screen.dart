import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';
import 'package:valoprosuser/ui/team_details.dart';
import 'package:valoprosuser/ui/widgets/team_tile.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  bool isLoading = false;
  List<String> teamList = [];
  CollectionReference teams = FirebaseFirestore.instance.collection('Teams');
  void getTeams() async {
    setState(() {
      isLoading = true;
    });
    await teams.get().then((value) async {
      for (int i = 0; i < value.docs.length; i++) {
        teamList.add(value.docs.elementAt(i).get('teamName'));
      }
    });
    setState(() {
      isLoading = false;
    });
    print(teamList);
  }

  @override
  void initState() {
    getTeams();
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
              : Container(
                  width: SizeConfig.screenWidth! * 0.8,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: teamList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return TeamDetails(
                                    teamName: teamList[index],
                                  );
                                });
                          },
                          child: TeamTile(
                            name: teamList[index],
                          ),
                        );
                      }),
                )),
    );
  }
}
