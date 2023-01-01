import 'package:athkar/core/theme/colors/light_theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData getLightThemeData() => ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorsLight.primaryColor,
      backgroundColor: ColorsLight.backgroundColor,
      fontFamily: 'NotoKufiArabic',
      textTheme: appTextTheme,
      appBarTheme: const AppBarTheme(
        color: ColorsLight.primaryColor,
        foregroundColor: ColorsLight.backgroundColor,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: ColorsLight.backgroundColor,
        backgroundColor: ColorsLight.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorsLight.primaryColor),
          foregroundColor:
              MaterialStateProperty.all(ColorsLight.backgroundColor),
        ),
      ),
      splashColor: ColorsLight.splashColor,
      iconTheme: const IconThemeData(
        color: ColorsLight.iconColor,
        size: 45,
      ),
      chipTheme: const ChipThemeData(
        backgroundColor: ColorsLight.primaryColor,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: ColorsLight.primaryColor,
      ),
    );

TextTheme appTextTheme = const TextTheme(
  headlineMedium: TextStyle(
    fontSize: 28,
    color: ColorsLight.textColorHeadlineMedium,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    fontSize: 16,
    color: ColorsLight.textColorTitleSmall,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorsLight.textColorBodyMedium,
    overflow: TextOverflow.fade,
  ),
  bodyLarge: TextStyle(
    fontSize: 24,
    color: ColorsLight.textColorBodyMedium,
    overflow: TextOverflow.fade,
  ),
  bodyMedium: TextStyle(
    fontSize: 18,
    color: ColorsLight.textColorBodyMedium,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.bold,
  ),
  bodySmall: TextStyle(
    fontSize: 14,
    color: ColorsLight.textColorBodySmall,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.normal,
  ),
);
