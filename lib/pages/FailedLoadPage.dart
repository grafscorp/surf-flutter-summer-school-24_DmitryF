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
            "Упс",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: 63),
          ),
          const Text("Произошла ошибка.\nПопробуйте снова."),
          ElevatedButton(
            onPressed: () {},
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 36, 115, 135))),
            child: Text(
              "Попробовать снова".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
