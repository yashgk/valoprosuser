import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/app_colors.dart';
import 'package:valoprosuser/core/constant/app_style.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';

class TeamTile extends StatelessWidget {
  final String name;
  const TeamTile({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: SizeConfig.screenHeight! * 0.1,
      width: SizeConfig.screenWidth! * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.background.withOpacity(0.5)),
      child: Row(
        children: [
          Container(
            height: SizeConfig.screenHeight! * 0.1,
            width: SizeConfig.screenWidth! * 0.2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              color: AppColors.tomato,
            ),
            child: Center(
              child: Text(
                'TEAM',
                style: AppStyles.blackNormal18
                    .copyWith(color: AppColors.background),
              ),
            ),
          ),
          const SizedBox(
            width: 90,
          ),
          Text(
            name,
            style: AppStyles.blackNormal18.copyWith(color: AppColors.white),
          )
        ],
      ),
    );
  }
}
