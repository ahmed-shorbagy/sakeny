import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Light theme colors
const kLightPrimaryColor = Color(0xffE3F2FD);
const kLightSecondaryColor = Color(0xffFFCC80);
const kLightBackgroundColor = Color(0xffF5F5F5);
const kLightSurfaceColor = Color(0xffFFFFFF);
const kLightTextColor = Color(0xff424242);

// Dark theme colors
const kDarkPrimaryColor = Color(0xff263238);
const kDarkSecondaryColor = Color(0xffFFB74D);
const kDarkBackgroundColor = Color(0xff121212);
const kDarkSurfaceColor = Color(0xff1E1E1E);
const kDarkTextColor = Color(0xffEEEEEE);

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: kLightPrimaryColor,
    scaffoldBackgroundColor: kLightBackgroundColor,
    cardColor: kLightSurfaceColor,
    fontFamily: GoogleFonts.laila().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(kLightSurfaceColor),
        backgroundColor: WidgetStateProperty.all<Color>(kLightPrimaryColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: kLightPrimaryColor,
      secondary: kLightSecondaryColor,
      surface: kLightSurfaceColor,
      onPrimary: kLightTextColor,
      onSecondary: kLightTextColor,
      onSurface: kLightTextColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: kLightTextColor),
      bodyMedium: TextStyle(color: kLightTextColor),
      titleLarge: TextStyle(color: kLightTextColor),
      titleMedium: TextStyle(color: kLightTextColor),
      headlineLarge: TextStyle(color: kLightTextColor),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: kDarkPrimaryColor,
    scaffoldBackgroundColor: kDarkBackgroundColor,
    cardColor: kDarkSurfaceColor,
    fontFamily: GoogleFonts.laila().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(kDarkTextColor),
        backgroundColor: WidgetStateProperty.all<Color>(kDarkPrimaryColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: kDarkPrimaryColor,
      secondary: kDarkSecondaryColor,
      surface: kDarkSurfaceColor,
      onPrimary: kDarkTextColor,
      onSecondary: kDarkTextColor,
      onSurface: kDarkTextColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: kDarkTextColor),
      bodyMedium: TextStyle(color: kDarkTextColor),
      titleLarge: TextStyle(color: kDarkTextColor),
      titleMedium: TextStyle(color: kDarkTextColor),
      headlineLarge: TextStyle(color: kDarkTextColor),
    ),
  );
}
