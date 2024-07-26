import 'package:surf_flutter_summer_school_24/postgramAPI/PostgramAPI.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';

class PostgramPhotoController {
  static List<PhotoData> _photoList = [];
  static List<PhotoData> get photoList => _photoList;
  static Future<void> updatePhotoList() async {
    //_photoList = await MockPhotoRepository().getPhotos();
    _photoList = await PostgramAPI().getPhotos();
  }
}
