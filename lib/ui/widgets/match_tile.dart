import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/app_colors.dart';
import 'package:valoprosuser/core/constant/app_style.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';

class MatchTile extends StatelessWidget {
  final String teamA;
  final String teamB;
  final String scoreA;
  final String scoreB;
  const MatchTile(
      {required this.teamA,
      required this.teamB,
      required this.scoreA,
      required this.scoreB,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: SizeConfig.screenHeight! * 0.1,
      width: SizeConfig.screenWidth! * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.2,
                0.4,
                0.6,
                0.8
              ],
              colors: [
                AppColors.cyan,
                AppColors.cyan,
                AppColors.lightred,
                AppColors.lightred,
              ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/icons/user.png'),
          Text(
            teamA,
            style: AppStyles.blackHeader24
                .copyWith(color: AppColors.notreallyblack),
          ),
          Text(
            scoreA,
            style: AppStyles.blackHeader24
                .copyWith(color: AppColors.notreallyblack),
          ),
          Text(
            scoreB,
            style: AppStyles.blackHeader24
                .copyWith(color: AppColors.notreallyblack),
          ),
          Text(
            teamB,
            style: AppStyles.blackHeader24
                .copyWith(color: AppColors.notreallyblack),
          ),
          Image.asset('assets/icons/user.png'),
        ],
      ),
    );
  }
}
