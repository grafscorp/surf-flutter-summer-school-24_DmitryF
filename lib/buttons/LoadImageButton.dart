// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:surf_flutter_summer_school_24/buttons/SettingButtonRef.dart';
import 'package:surf_flutter_summer_school_24/models/ImagePicker.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/bloc/postImage/ImagePostBloc.dart';

class LoadImageButton extends StatelessWidget implements SettingButtonRef {
  @override
  IconThemeData iconStyle;

  @override
  TextStyle textStyle;

  LoadImageButton({
    super.key,
    required this.iconStyle,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final tempImagePostBloc = BlocProvider.of<ImagePostBloc>(context);
        final _selectedImage =
            await ImagePickerController.pickImageFromGallery();
        if (_selectedImage == null) {
          tempImagePostBloc.add(ErrorImagePostEvent());
          return;
        }
        tempImagePostBloc.add(LoadImagePostEvent(newPhoto: _selectedImage));
      },
      label: Row(children: [
        Text(
          "Загрузить фото...",
          style: textStyle,
        )
      ]),
      icon: Icon(
        color: iconStyle.color,
        Icons.cloud_upload_outlined,
        size: iconStyle.size,
      ),
    );
  }
}
