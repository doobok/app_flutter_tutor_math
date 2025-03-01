import 'package:flutter/cupertino.dart';

class AppTheme {
  static const Color primaryColor = CupertinoColors.activeGreen;
  static const Color secondaryColor = CupertinoColors.systemGrey;
  static const Color accentColor = CupertinoColors.systemYellow;
  static const Color primaryTextColor = CupertinoColors.black;
  static const Color secondaryTextColor = CupertinoColors.systemGrey;
  static const Color lightBackgroundColor = CupertinoColors.extraLightBackgroundGray;
  static const Color darkBackgroundColor = CupertinoColors.darkBackgroundGray;
  static const Color lightCardColor = CupertinoColors.white;
  static const Color darkCardColor = CupertinoColors.systemGrey6;
  static const Color iconColor = CupertinoColors.activeGreen;

  static const TextStyle lightTitleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: CupertinoColors.black,
  );

  static const TextStyle lightBodyTextStyle = TextStyle(
    fontSize: 16,
    color: CupertinoColors.black,
  );

  static const TextStyle lightCaptionTextStyle = TextStyle(
    fontSize: 14,
    color: CupertinoColors.systemGrey,
  );

  static const TextStyle darkTitleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: CupertinoColors.white,
  );

  static const TextStyle darkBodyTextStyle = TextStyle(
    fontSize: 16,
    color: CupertinoColors.white,
  );

  static const TextStyle darkCaptionTextStyle = TextStyle(
    fontSize: 14,
    color: CupertinoColors.systemGrey2,
  );

  static const double cardBorderRadius = 12.0;
  static const double buttonBorderRadius = 8.0;
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  static const BoxShadow cardShadow = BoxShadow(
    color: CupertinoColors.systemGrey,
    offset: Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const BoxShadow buttonShadow = BoxShadow(
    color: CupertinoColors.systemGrey,
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
  );

  static const Duration buttonAnimationDuration = Duration(milliseconds: 200);
  static const Duration pageTransitionDuration = Duration(milliseconds: 300);
  static const double bottomBarIconSize = 24.0;
  static const double cardIconSize = 32.0;

  static final CupertinoThemeData lightTheme = CupertinoThemeData(
    primaryColor: primaryColor,
    textTheme: CupertinoTextThemeData(
      textStyle: lightBodyTextStyle,
      navTitleTextStyle: lightTitleTextStyle,
    ),
    barBackgroundColor: lightBackgroundColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    primaryContrastingColor: iconColor,
  );

  static final CupertinoThemeData darkTheme = CupertinoThemeData(
    primaryColor: primaryColor,
    textTheme: CupertinoTextThemeData(
      textStyle: darkBodyTextStyle,
      navTitleTextStyle: darkTitleTextStyle,
    ),
    barBackgroundColor: darkBackgroundColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    primaryContrastingColor: iconColor,
  );

  static CupertinoThemeData getTheme(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }
}