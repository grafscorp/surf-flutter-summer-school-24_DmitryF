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
    //elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
        elevation: const WidgetStatePropertyAll(0.0),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        side: const WidgetStatePropertyAll(
          BorderSide(color: Colors.transparent, width: 0),
        ),
      ),
    ),
  );
}
