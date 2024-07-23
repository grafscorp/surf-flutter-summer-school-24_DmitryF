import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/main.dart';

const CountThemes = 2;

class Themebottomsheet extends StatelessWidget {
  const Themebottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      child: ListView.builder(
          itemCount: CountThemes,
          itemBuilder: (context, index) {
            return ThemeTileButton(index);
          }),
    );
  }

  Widget ThemeTileButton(int index) {
    return ElevatedButton(onPressed: () {}, child: Text("Theme #$index"));
  }
}
