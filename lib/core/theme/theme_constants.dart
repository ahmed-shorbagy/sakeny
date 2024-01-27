import 'package:flutter/material.dart';

const kLightPrimaryColor = Color(0xffB2FCFB);
const kDarkPrimaryColor = Color(0xff78D7D5);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kLightPrimaryColor,
  colorScheme: const ColorScheme.light(
    background: Color(0xffF5F5F5),
    primary: kLightPrimaryColor,
    secondary: Color(0xffFFB74D),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Color(0xff333333),
    ),
    titleLarge: TextStyle(
      color: Color(0xff333333),
    ),
    titleMedium: TextStyle(
      color: Color(0xff333333),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: kDarkPrimaryColor,
  colorScheme: const ColorScheme.dark(
    background: Color(0xff121212),
    primary: kDarkPrimaryColor,
    secondary: Color(0xffFFB74D),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white),
  ),
);
