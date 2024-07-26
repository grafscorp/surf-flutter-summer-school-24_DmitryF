// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:surf_flutter_summer_school_24/buttons/SettingButtonRef.dart';
import 'package:surf_flutter_summer_school_24/models/ImageCompletedDialog.dart';
import 'package:surf_flutter_summer_school_24/models/ImageFailedLoadDialog.dart';
import 'package:surf_flutter_summer_school_24/models/ImageLoadingDialog.dart';
import 'package:surf_flutter_summer_school_24/models/ImagePicker.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/bloc/ImageList/ImageListBloc.dart';
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
    // ImagePostBloc testProviderImagePost;
    // ImageListBloc testProviderImageList;
    // testProviderImagePost = BlocProvider.of<ImagePostBloc>(context);
    // testProviderImageList = BlocProvider.of<ImageListBloc>(context);
    return ElevatedButton.icon(
      //style: _buttonTheme,
      onPressed: () async {
        // if (PostgramPhotoController.photoList == []) return;
        final _selectedImage =
            await ImagePickerController.pickImageFromGallery();
        if (_selectedImage == null) {
          //testProviderImagePost.add();
          //testProviderImageList.add(ErrorImageLisrEvent());
          BlocProvider.of<ImagePostBloc>(context).add(ErrorImagePostEvent());
          return;
        }
        BlocProvider.of<ImagePostBloc>(context)
            .add(LoadImagePostEvent(newPhoto: _selectedImage));
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BlocBuilder<ImagePostBloc, ImagePostState>(
                builder: (contextbloc, state) {
              if (state is ImagePostLoading) {
                return const ImageLoadingDialog();
              } else if (state is ImagePostLoaded) {
                BlocProvider.of<ImageListBloc>(context)
                    .add(LoadImageListEvent());
                return const ImageCompletedDialog();
              } else {
                return const ImageFailedLoadDialog();
              }
            });
          },
        );
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
