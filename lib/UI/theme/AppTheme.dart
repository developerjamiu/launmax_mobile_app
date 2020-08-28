import 'package:flutter/material.dart';


class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    bottomAppBarColor: lightBG,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: darkBG,
        fontSize: 18,
        fontFamily: 'Poppins',
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
      fillColor: Color(0xFFF4F4F4),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        borderSide: BorderSide(color: Color(0xFF578DDE)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Color(0xFFF4F4F4)),
      ),
      hintStyle: TextStyle(
          color: Color(0XFFBDBDBD), fontSize: 16, fontFamily: "Poppins"),
    ),
    
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: lightBG,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkBG,
          fontSize: 24,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

//   static ThemeData lightTheme() {
//    final base = ThemeData.light();
// return ThemeData(
  
//   brightness: Brightness.light,
//   backgroundColor: Color(0xFFFAFAFA),
//   scaffoldBackgroundColor: Color(0xFFFAFAFA),
//   hintColor: Color(0xff888888),
//   primaryColorLight: Color(0xffffffff),
//   accentColor: Color(0xff181E26),
//   dividerColor: Color(0x33E4E4E4),
//   textTheme: _buildTextTheme(base.textTheme),
//   fontFamily: 'SFProText',
// );
//   }
  //Colors for theme
  static Color lightPrimary = Color(0xFF0F75BC);
  static Color darkPrimary = Color(0xFF04172A);
  static Color lightAccent = Colors.black;
  static Color darkAccent = Colors.white;
  static Color lightBG = Color(0xFFFFFFFF);
  static Color darkBG = Color(0xFF04172A);
  static Color badgeColor = Colors.red;
  static Color textColor = Color(0xFF03131F);

  //Reusable Colors
  static Color grey = Color(0xFF999999);

  //Reusable Spacers
  static const kPaddingS = 8.0;
  static const kPaddingM = 16.0;
  static const kPaddingL = 32.0;

  ///Text Theme
  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      bodyText2: TextStyle(
          fontWeight: FontWeight.normal, color: Colors.black, fontSize: 12.0),
      bodyText1: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        color: Colors.black,
      ),
      button: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 17,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 18.0,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 16.0,
      ),
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.black,
      ),
      headline2: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xFFA7A7A7)),
    );
  }
}

class AppColor {
  static const text2 = Color(0xFF999999);

  static const text1 = Color(0xFF787676);

  static const divider = Color(0x33E4E4E4);

  static const stroke = Color(0x99E4E4E4);

  static const background = Color(0xFFFAFAFA);

  /// Same as rgba(50, 50, 71, 0.08)
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
      500: Color(0xFF135A59),
      600: Color(0xFF23a4a2),
      700: Color(0xFF197574),
      800: Color(0xFF0f4645),
      900: Color(0xFF051717),
    },
  );
  static const int _primaryValue = 0xFF135A59;
}
