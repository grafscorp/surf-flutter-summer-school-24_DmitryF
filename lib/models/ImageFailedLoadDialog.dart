import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/bloc/postImage/ImagePostBloc.dart';

class ImageLoadingDialog extends StatelessWidget {
  const ImageLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20.0),
      title: const Text("Ошибка!"),
      content: const Text("Не удалось загрузить изображение"),
      actions: [
        TextButton(
          onPressed: () {
            BlocProvider.of<ImagePostBloc>(context).add(InitImagePostEvent());
            Navigator.of(context).pop();
          },
          child: const Text("Ok"),
        )
      ],
    );
  }
}
