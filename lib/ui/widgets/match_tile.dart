import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/app_colors.dart';
import 'package:valoprosuser/core/constant/app_style.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';

class MatchTile extends StatelessWidget {
  const MatchTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            '11',
            style: AppStyles.blackHeader24
                .copyWith(color: AppColors.notreallyblack),
          ),
          Text(
            '15',
            style: AppStyles.blackHeader24
                .copyWith(color: AppColors.notreallyblack),
          ),
          Image.asset('assets/icons/user.png'),
        ],
      ),
    );
  }
}
