import 'package:flutter/cupertino.dart';

abstract class SizeConfig {
  static  double? screenHeight;
  static  double? screenWidth;
  static  double? statusBarHeight;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenHeight = mediaQuery.size.height;
    screenWidth = mediaQuery.size.width;
    statusBarHeight = mediaQuery.padding.top;
  }
}
