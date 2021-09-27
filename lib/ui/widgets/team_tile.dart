import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/app_colors.dart';
import 'package:valoprosuser/core/constant/app_style.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';

class TeamTile extends StatelessWidget {
  const TeamTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.1,
      width: SizeConfig.screenWidth! * 0.9,
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
            width: 50,
          ),
          Text(
            'TEAM NAME',
            style: AppStyles.blackNormal18.copyWith(color: AppColors.white),
          )
        ],
      ),
    );
  }
}
