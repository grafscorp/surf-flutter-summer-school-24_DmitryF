import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/themes/scr/TextTheme.dart';

ThemeData lightTheme() {
  return ThemeData(
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(),
    indicatorColor: Colors.black,
    primaryColor: Colors.black,
    textTheme: lightTextStyle(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    // extensions: <ThemeExtension<dynamic>> [
    // ],
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white, scrolledUnderElevation: 0.0),
    iconTheme: const IconThemeData(color: Colors.black),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
  );
}
