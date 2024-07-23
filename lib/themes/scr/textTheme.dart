import 'package:flutter/material.dart';

TextTheme lightTextStyle() {
  return const TextTheme(
    headlineLarge: TextStyle(color: Colors.black),
    headlineMedium: TextStyle(color: Colors.black),
    headlineSmall: TextStyle(color: Colors.black),
  );
}

TextTheme darkTextStyle() {
  return const TextTheme(
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: Colors.white),
    headlineSmall: TextStyle(color: Colors.white),
  );
}
