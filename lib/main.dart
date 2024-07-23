import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/pages/galleryPage.dart';
import 'package:surf_flutter_summer_school_24/themes/themedark.dart';
import 'package:surf_flutter_summer_school_24/themes/themelight.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DarkTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: GalleryPage(),
        ),
      ),
    );
  }
}
