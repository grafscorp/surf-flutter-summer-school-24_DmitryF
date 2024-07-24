import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/themes/scr/TextTheme.dart';

ThemeData darkTheme() {
  return ThemeData(
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark(),
    indicatorColor: Colors.white,
    primaryColor: Colors.white,
    textTheme: darkTextStyle(),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    // extensions: <ThemeExtension<dynamic>> [
    // ],
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black, scrolledUnderElevation: 0.0),
    iconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
  );
}
