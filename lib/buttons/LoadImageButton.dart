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
      //style: _buttonTheme,
      onPressed: () async {
        // if (PostgramPhotoController.photoList == []) return;
        final _selectedImage =
            await ImagePickerController.pickImageFromGallery();
        if (_selectedImage == null) {
          BlocProvider.of<ImagePostBloc>(context).add(ErrorImagePostEvent());
          return;
        }
        BlocProvider.of<ImagePostBloc>(context)
            .add(LoadImagePostEvent(newPhoto: _selectedImage));
        //if (_imagePostBloc.state is Im)
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
