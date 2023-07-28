import 'dart:ui';

import 'package:flutter/material.dart';

class ColorPalette{
  static const Color mainBlue = Color(0xFF5E96FF);
  static const Color trueWhite = Color(0xFFFFFFFF);
  static const Color mainWhite = Color (0xFFF5F5F5);
  static const Color mainBlack = Color (0xFF000000);
  static const Color mainBasic = Color(0xFFFEFFF1);
  static const Color profileRed = Color(0xFFFF0000);
}


class ColorConstants {
  static const themeColor = Color(0xfff5a623);
  static Map<int, Color> swatchColor = {
    50: themeColor.withOpacity(0.1),
    100: themeColor.withOpacity(0.2),
    200: themeColor.withOpacity(0.3),
    300: themeColor.withOpacity(0.4),
    400: themeColor.withOpacity(0.5),
    500: themeColor.withOpacity(0.6),
    600: themeColor.withOpacity(0.7),
    700: themeColor.withOpacity(0.8),
    800: themeColor.withOpacity(0.9),
    900: themeColor.withOpacity(1),
  };
  static const primaryColor = Color(0xff203152);
  static const greyColor = Color(0xffaeaeae);
  static const greyColor2 = Color(0xffE8E8E8);
}