import 'package:surf_flutter_summer_school_24/postgramAPI/PostgramAPI.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/MockPhotoRepository.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';

class PostgramPhotoController {
  static List<PhotoData> photoList = [];
  static Future<void> updatePhotoList() async {
    photoList = await MockPhotoRepository().getPhotos();
    //photoList = await PostgramAPI().getPhotos();
  }
}
