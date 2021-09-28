import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';
import 'package:valoprosuser/ui/widgets/player_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  CollectionReference players =
      FirebaseFirestore.instance.collection('Players');
  bool isLoading = false;
  List<String> playerList = [];
  void getPlayers() async {
    setState(() {
      isLoading = true;
    });
    await players.get().then((value) async {
      for (int i = 0; i < value.docs.length; i++) {
        playerList.add(value.docs.elementAt(i).get('playerName'));
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getPlayers();
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
                  child: ListView.builder(
                      itemCount: playerList.length,
                      itemBuilder: (context, index) {
                        return PlayerTile(
                          right: index % 2 == 0 ? true : false,
                          name: playerList[index],
                        );
                      }))),
    );
  }
}
