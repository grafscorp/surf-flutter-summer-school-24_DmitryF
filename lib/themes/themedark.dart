import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/themes/scr/textTheme.dart';

ThemeData DarkTheme() {
  return ThemeData(
      textTheme: darkTextStyle(),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      // extensions: <ThemeExtension<dynamic>> [
      // ],
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      iconTheme: IconThemeData(color: Colors.white));
}
