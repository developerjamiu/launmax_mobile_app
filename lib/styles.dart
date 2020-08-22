import 'package:flutter/material.dart';

class AppColor {
  static const text2 = Color(0xFF999999);

  static const text1 = Color(0xFF787676);

  static const divider = Color(0x33E4E4E4);

  static const background = Color(0xFFFAFAFA);

  static const offset = Color(0x14323247);

  static const neutralBlack = Color(0xFF151522);

  static const primaryColor = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFe8fafa),
      100: Color(0xFFb9f0ef),
      200: Color(0xFF8ae6e5),
      300: Color(0xFF5bdcdb),
      400: Color(0xFF2cd3d0),
      500: Color(_primaryValue),
      600: Color(0xFF23a4a2),
      700: Color(0xFF197574),
      800: Color(0xFF0f4645),
      900: Color(0xFF051717),
    },
  );
  static const int _primaryValue = 0xFF135A59;
}
