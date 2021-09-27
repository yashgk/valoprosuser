import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/app_colors.dart';
import 'package:valoprosuser/core/constant/app_style.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';

class PlayerTile extends StatelessWidget {
  final bool right;
  const PlayerTile({required this.right, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.15,
      width: SizeConfig.screenWidth!,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: SizeConfig.screenHeight! * 0.06,
            width: SizeConfig.screenWidth! * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.background.withOpacity(0.5),
            ),
          ),
          Positioned(
              bottom: 0,
              left: right
                  ? SizeConfig.screenWidth! * 0.02
                  : SizeConfig.screenWidth! * 0.78,
              // right: right ? SizeConfig.screenWidth! * 0.02 : 0,
              child: Container(
                height: SizeConfig.screenHeight! * 0.1,
                width: SizeConfig.screenWidth! * 0.2,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background,
                ),
                child: Image.asset('assets/icons/userb.png'),
              )),
          Positioned(
              bottom: 0,
              left: right
                  ? SizeConfig.screenWidth! * 0.02
                  : SizeConfig.screenWidth! * 0.9,
              // right: right ? SizeConfig.screenWidth! * 0.02 : 0,
              child: Container(
                height: SizeConfig.screenHeight! * 0.04,
                width: SizeConfig.screenWidth! * 0.08,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.tomato,
                ),
                child: Center(
                  child: Text(
                    'LOGO',
                    style: AppStyles.blackSmall14
                        .copyWith(fontSize: 10, color: AppColors.background),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
