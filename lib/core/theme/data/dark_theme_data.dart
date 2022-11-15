import 'package:athkar/core/theme/colors/dark_theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData getDarkThemeData() => ThemeData(
  brightness: Brightness.dark,
  primaryColor: ColorsDark.primaryColor,
  backgroundColor: ColorsDark.backgroundColor,
  fontFamily: 'NotoKufiArabic',
  textTheme: appTextTheme,
  appBarTheme: const AppBarTheme(
    color: ColorsDark.primaryColor,
    foregroundColor: ColorsDark.backgroundColor,
    elevation: 0.0,
    iconTheme: IconThemeData(
        size: 25
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: ColorsDark.backgroundColor,
    backgroundColor: ColorsDark.primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ColorsDark.primaryColor),
      foregroundColor: MaterialStateProperty.all(ColorsDark.backgroundColor),
    ),
  ),
  splashColor: ColorsDark.splashColor,

  iconTheme: const IconThemeData(
    color: ColorsDark.iconColor,
    size: 45,
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: ColorsDark.primaryColor,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: ColorsDark.primaryColor,
  ),
);




TextTheme appTextTheme = const TextTheme(
  headlineMedium: TextStyle(
    fontSize: 28,
    color: ColorsDark.textColorHeadlineMedium,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.bold,
  ),


  titleSmall: TextStyle(
    fontSize: 18,
    color: ColorsDark.textColorTitleSmall,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorsDark.textColorBodyMedium,
    overflow: TextOverflow.fade,
  ),


  bodyLarge: TextStyle(
    fontSize: 24,
    color: ColorsDark.textColorBodyMedium,
    overflow: TextOverflow.fade,
  ),
  bodyMedium: TextStyle(
    fontSize: 18,
    color: ColorsDark.textColorBodyMedium,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.bold,
  ),
  bodySmall: TextStyle(
    fontSize: 14,
    color: ColorsDark.textColorBodySmall,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.normal,
  ),

);