import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_colors.dart';

class AppTheme {
  AppTheme._();

  static Color _iconColor = MyColors.primary;

  static const Color _lightPrimaryColor = MyColors.primary;
  static const Color _lightPrimaryColorSecondary = MyColors.secondary;
  static const Color _lightPrimaryColorSecondaryVariant =
      MyColors.secondaryVariant;
  static const Color _lightPrimaryVariantColor = MyColors.primaryVariant;
  static const Color _lightOnPrimaryColor = MyColors.onPrimary;
  static const Color _lightSecondaryColor = MyColors.buttonColor;
  static const Color _lightGreyColor = MyColors.gray25;
  static const Color _lightBrightColor = MyColors.gray60;
  static const Color _lightSurfaceColor = MyColors.cardBackground;

  static final TextStyle _lightScreenHeadingTextStyle =
      TextStyle(fontSize: 32.0, color: _lightPrimaryColor);
  static final TextStyle _lightSubHeadingTextStyle =
      TextStyle(fontSize: 20.0, color: _lightBrightColor);
  static final TextStyle _lightAppBarHeadingTextStyle = TextStyle(//headline1
      fontSize: 18.0, color: _lightPrimaryColor, fontWeight: FontWeight.bold);
  static final TextStyle _lightScreenTaskNameTextStyle = TextStyle(//bodyText2 normat text
    fontSize: 16.0,
    color: _lightPrimaryColor,fontWeight: FontWeight.normal
  );
  //bodytext1
  static final TextStyle _lightScreenTaskDurationTextStyle =
      TextStyle(fontSize: 16.0, color: _lightPrimaryColorSecondaryVariant,fontWeight: FontWeight.normal);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.white60,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: _lightPrimaryColor,
        ),
      ),
      color: _lightOnPrimaryColor,
      iconTheme: IconThemeData(
        size: 100,
        color: _lightPrimaryColor,
      ),
      actionsIconTheme: IconThemeData(color:_lightPrimaryColor ),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      scaffoldBackgroundColor: MyColors.white60,
      textTheme: CupertinoTextThemeData(
        navTitleTextStyle: TextStyle(color: _lightPrimaryColor),
        navActionTextStyle: TextStyle(color: _lightPrimaryColor),
        tabLabelTextStyle: TextStyle(color: _lightPrimaryColor),
        actionTextStyle: TextStyle(
          color: _lightPrimaryColor,
        ),
        textStyle: TextStyle(
          color: _lightPrimaryColorSecondaryVariant,
        ),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      secondary: _lightPrimaryColorSecondary,
      secondaryVariant: _lightPrimaryColorSecondaryVariant,
      primaryVariant: _lightPrimaryVariantColor,
      onPrimary: _lightOnPrimaryColor,
      onSecondary: _lightBrightColor,
      background: _lightPrimaryColor,
      surface: _lightSurfaceColor,
      onSurface: _lightGreyColor,
//        brightness: Brightness.light,
    ),
    iconTheme: IconThemeData(color: _lightPrimaryColor, size: 24),
    textTheme: _lightTextTheme,
    disabledColor: _lightBrightColor,
    dialogBackgroundColor: _lightPrimaryVariantColor,
    accentColor: _lightPrimaryColor,
    backgroundColor: _lightOnPrimaryColor,
    dividerColor: Colors.grey.withOpacity(0.3),
  );

  static final TextTheme _lightTextTheme = TextTheme(
      headline5: _lightScreenHeadingTextStyle,
      bodyText2: _lightScreenTaskDurationTextStyle,
      bodyText1: _lightScreenTaskNameTextStyle,
      headline1: _lightAppBarHeadingTextStyle,
      headline2: _lightSubHeadingTextStyle,
      caption: _lightScreenTaskDurationTextStyle);
}
