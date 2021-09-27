import 'package:flutter/material.dart';
import 'package:valoprosuser/core/constant/sizeconfig.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.1,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
    );
  }
}
