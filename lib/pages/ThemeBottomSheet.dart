import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/models/ImagePicker.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/PostgramAPI.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PostgramPhotoController.dart';
import 'package:surf_flutter_summer_school_24/themes/ThemeProvider.dart';

class MenuBottomSheet extends StatefulWidget {
  const MenuBottomSheet({super.key});

  @override
  State<MenuBottomSheet> createState() => _MenuBottomSheetState();
}

class _MenuBottomSheetState extends State<MenuBottomSheet> {
  //Сделал StateFull т.к. компилятору не нравилось
  final _iconSize = 22.0;

  final _fontSize = 22.0;

  late Color _iconColor;

  late TextStyle _textStyleMBS;

  late ButtonStyle _buttonTheme;

  @override
  Widget build(BuildContext context) {
    //Theme Override
    _textStyleMBS = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(fontSize: _fontSize);

    _iconColor = Theme.of(context).iconTheme.color!;

    _buttonTheme = Theme.of(context).elevatedButtonTheme.style!.copyWith(
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
        elevation: const WidgetStatePropertyAll(0.0),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        side: const WidgetStatePropertyAll(
          BorderSide(color: Colors.transparent, width: 0),
        ));
    return Container(
        //height: 300.0,
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _switchThemeButton(context),
            const SizedBox(
              height: 20.0,
            ),
            _loadPhotoButton
          ],
        ));
  }

  Widget _switchThemeButton(BuildContext cntx) {
    return ElevatedButton.icon(
      style: _buttonTheme,
      onPressed: () {
        cntx.read<Themeprovider>().changeTheme();
      },
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Тема",
            style: _textStyleMBS,
          ),
          Text(
            cntx.read<Themeprovider>().isDark ? "Темная" : "Светлая",
            style: _textStyleMBS,
          )
        ],
      ),
      icon: Icon(
        cntx.read<Themeprovider>().isDark
            ? Icons.dark_mode
            : Icons.light_mode_outlined,
        size: _iconSize,
        color: _iconColor,
      ),
    );
  }

  Widget get _loadPhotoButton => ElevatedButton.icon(
        style: _buttonTheme,
        onPressed: () async {
          if (PostgramPhotoController.photoList == []) return;
          final _selectedImage =
              await ImagePickerController.pickImageFromGallery();

          PostgramAPI().getPhotos();
          if (_selectedImage != null) {
            if (PostgramAPI().postPhoto(_selectedImage) == true) {
              PostgramPhotoController.updatePhotoList();
            }
            ;
          }
        },
        label: Row(children: [
          Text(
            "Загрузить фото...",
            style: _textStyleMBS,
          )
        ]),
        icon: Icon(
          color: _iconColor,
          Icons.cloud_upload_outlined,
          size: _iconSize,
        ),
      );
}
