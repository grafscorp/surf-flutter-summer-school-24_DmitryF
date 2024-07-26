import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/bloc/ImageList/ImageListBloc.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/bloc/postImage/ImagePostBloc.dart';

abstract class ImagePostDialog {
  static getImagePostCompleteDialog(BuildContext context) {
    return AlertDialog(
      title: const Icon(Icons.check_circle_outline),
      content: const Text("Изображение загружено!"),
      contentPadding: const EdgeInsets.all(20.0),
      actions: [
        TextButton(
            onPressed: () {
              BlocProvider.of<ImagePostBloc>(context).add(InitImagePostEvent());
              BlocProvider.of<ImageListBloc>(context).add(
                  LoadImageListEvent()); // BlocProvider.of<ImageListBloc>(context)
              // .add(LoadImageListEvent());
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    );
  }

  static getImagePostLoadingDialog(BuildContext context) {
    return const AlertDialog(
      title: Text("Загрузка изображения..."),
      //content:
      actions: [
        SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }

  static getImagePostFailedDialog(BuildContext context) {
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
