import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kLightPrimaryColor = Color(0xffBFDBFE);
const kDarkPrimaryColor = Color(0xff1E293B);

ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.laila().fontFamily,
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
      backgroundColor: MaterialStatePropertyAll<Color>(
        Colors.black,
      ),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
    ),
  ),
  brightness: Brightness.light,
  primaryColor: kLightPrimaryColor,
  colorScheme: const ColorScheme.light(
      background: Color(0xffF5F5F5),
      primary: kLightPrimaryColor,
      secondary: Color(0xffFFB74D),
      outline: Colors.black),
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
    headlineLarge: TextStyle(
      color: Color(0xff333333),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.laila().fontFamily,
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
      backgroundColor: MaterialStatePropertyAll<Color>(
        Color(0xff334155),
      ),
    ),
  ),
  primaryColor: kDarkPrimaryColor,
  colorScheme: const ColorScheme.dark(
      background: Color(0xff121212),
      primary: kDarkPrimaryColor,
      secondary: Color(0xffFFB74D),
      outline: Colors.white),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white),
  ),
);
