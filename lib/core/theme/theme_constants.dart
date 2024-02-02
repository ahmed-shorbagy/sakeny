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
  colorScheme: ColorScheme.light(
      background: const Color(0xffF5F5F5),
      primary: kLightPrimaryColor,
      secondary: const Color(0xffFFB74D),
      outline: Colors.black,
      surface: Colors.grey.shade400),
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
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
    ),
  ),
  primaryColor: kDarkPrimaryColor,
  colorScheme: ColorScheme.dark(
      background: const Color(0xff121212),
      primary: kDarkPrimaryColor,
      secondary: const Color(0xffFFB74D),
      outline: Colors.white,
      surface: const Color(0xff000113).withAlpha(150)),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white),
  ),
);
