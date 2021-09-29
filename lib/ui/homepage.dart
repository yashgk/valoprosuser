import 'dart:io';

import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/app_colors.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';
import 'package:valoprosuser/ui/player_screen.dart';
import 'package:valoprosuser/ui/team_screen.dart';
import 'package:valoprosuser/ui/tournament_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget body = PlayerScreen();
  List<Widget> blist = [PlayerScreen(), TeamScreen(), TournamentScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/bg2.jpg'))),
          child: Stack(
            children: [
              body,
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: SizeConfig.screenHeight! * 0.08,
                    width: SizeConfig.screenWidth!,
                    color: AppColors.tomato,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              body = blist[0];
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/user.png'),
                              Text('Player')
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              body = blist[1];
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/team.png'),
                              Text('Team')
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              body = blist[2];
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/results.png'),
                              Text('Match')
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
