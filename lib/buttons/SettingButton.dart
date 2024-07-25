import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/pages/ThemeBottomSheet.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _showThemeBottomSheet(context);
        },
        icon: const Icon(
          Icons.more_vert_outlined,
          size: 28,
        ));
  }

  void _showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const MenuBottomSheet());
  }
}
