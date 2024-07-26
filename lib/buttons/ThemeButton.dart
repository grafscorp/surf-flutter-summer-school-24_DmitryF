// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:surf_flutter_summer_school_24/buttons/SettingButtonRef.dart';
import 'package:surf_flutter_summer_school_24/themes/ThemeProvider.dart';

class ThemeButton extends StatelessWidget implements SettingButtonRef {
  @override
  IconThemeData iconStyle;

  @override
  TextStyle textStyle;

  ThemeButton({
    super.key,
    required this.iconStyle,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      //style: _buttonTheme,
      onPressed: () {
        context.read<Themeprovider>().changeTheme();
      },
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Тема",
            style: textStyle,
          ),
          Text(
            context.read<Themeprovider>().isDark ? "Темная" : "Светлая",
            style: textStyle,
          )
        ],
      ),
      icon: Icon(
        context.read<Themeprovider>().isDark
            ? Icons.dark_mode
            : Icons.light_mode_outlined,
        size: iconStyle.size,
        color: iconStyle.color,

        //size: _iconSize,
        //color: _iconColor,
      ),
    );
  }
}
