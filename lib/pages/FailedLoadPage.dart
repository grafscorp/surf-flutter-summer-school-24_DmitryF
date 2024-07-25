// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FailedLoadPage extends StatelessWidget {
  const FailedLoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline_outlined,
            size: 74,
          ),
          Text(
            "Упс!",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: 36),
          ),
          Text(
            "Произошла ошибка.\nПопробуйте снова.",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: 16),
          ),
          ElevatedButton(
            onPressed: () {},
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0))),
                padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0)),
                backgroundColor: const WidgetStatePropertyAll(
                    Color.fromARGB(255, 36, 115, 135))),
            child: Text(
              "Попробовать снова".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
