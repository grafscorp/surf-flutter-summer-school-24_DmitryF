import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';

abstract interface class PhotoRepository {
  Future<List<PhotoData>?> getPhotos();
}
