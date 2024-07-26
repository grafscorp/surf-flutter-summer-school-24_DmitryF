// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/buttons/LoadImageButton.dart';
import 'package:surf_flutter_summer_school_24/buttons/ThemeButton.dart';

class MenuBottomSheet extends StatefulWidget {
  const MenuBottomSheet({super.key});

  @override
  State<MenuBottomSheet> createState() => _MenuBottomSheetState();
}

class _MenuBottomSheetState extends State<MenuBottomSheet> {
  //Сделал StateFull т.к. компилятору не нравилось
  final _iconSize = 22.0;

  final _fontSize = 22.0;

  IconThemeData settingIconTheme = const IconThemeData();

  TextStyle _textStyleMBS = const TextStyle();

  @override
  Widget build(BuildContext context) {
    //Theme Override
    _textStyleMBS = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(fontSize: _fontSize);

    settingIconTheme = Theme.of(context).iconTheme.copyWith(
          size: _iconSize,
        );

    return Container(
        //height: 300.0,
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeButton(
              iconStyle: settingIconTheme,
              textStyle: _textStyleMBS,
            ),
            const SizedBox(
              height: 20.0,
            ),
            LoadImageButton(
              iconStyle: settingIconTheme,
              textStyle: _textStyleMBS,
            )
          ],
        ));
  }
}
