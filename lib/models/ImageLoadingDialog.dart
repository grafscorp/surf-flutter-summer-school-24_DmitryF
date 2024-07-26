import 'package:flutter/material.dart';

class ImageFailedLoadDialog extends StatelessWidget {
  const ImageFailedLoadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
        title: Text("Загрузка изображения..."),
        //content:
        actions: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(),
          ),
        ]);
  }
}
