import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/themes/scr/TextTheme.dart';

ThemeData darkTheme() {
  return ThemeData(
    textTheme: darkTextStyle(),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    // extensions: <ThemeExtension<dynamic>> [
    // ],
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    iconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
  );
}
