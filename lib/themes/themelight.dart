import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/themes/scr/textTheme.dart';

ThemeData LightTheme() {
  return ThemeData(
      textTheme: lightTextStyle(),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      // extensions: <ThemeExtension<dynamic>> [
      // ],
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      iconTheme: IconThemeData(color: Colors.black));
}
