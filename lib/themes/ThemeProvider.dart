// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier {
  late SharedPreferences prefTheme;

  bool _isDark = false;
  bool get isDark => _isDark;

  void changeTheme() {
    _isDark = !_isDark;
    prefTheme.setBool("isDark", _isDark);
    notifyListeners();
  }

  void init() async {
    prefTheme = await SharedPreferences.getInstance();
    _isDark = prefTheme.getBool("isDark") ?? true;
    notifyListeners();
  }
}
