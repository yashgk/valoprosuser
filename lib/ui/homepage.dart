import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';
import 'package:valoprosuser/ui/widgets/custom_bottom_navbar.dart';
import 'package:valoprosuser/ui/widgets/match_tile.dart';
import 'package:valoprosuser/ui/widgets/player_tile.dart';
import 'package:valoprosuser/ui/widgets/team_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/bg2.jpg'))),
          child: Column(
            children: const [
              PlayerTile(
                right: false,
              ),
              PlayerTile(
                right: true,
              ),
              SizedBox(
                height: 50,
              ),
              TeamTile(),
              SizedBox(
                height: 50,
              ),
              MatchTile()
            ],
          )),
    );
  }
}
