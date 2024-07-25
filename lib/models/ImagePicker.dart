import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerController {
  static Future<XFile?> pickImageFromGallery() async {
    final _tempImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_tempImage == null) {
      return null;
    }
    return _tempImage;
  }
}
