// ignore_for_file: file_names

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
