// ignore_for_file: file_names
//Test lib

import 'package:http/http.dart' as http;
import 'dart:convert';
//End Test Lib

import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoRepository.dart';

class PostgramAPI implements PhotoRepository {
  @override
  Future<List<PhotoData>> getPhotos() async {
    List<PhotoData> photoList = [];

    var postgramPhotosResponse = await http.get(Uri.http("test.com", "photo"));
    var jsonPhotoData = jsonDecode(postgramPhotosResponse.body);
    for (var photoJson in jsonPhotoData['data']) {
      final photo = PhotoData(
        id: photoJson['id'],
        url: photoJson['url'],
      );
      photoList.add(photo);
    }
    return photoList;
  }
}


// Struct ImageDataPG{
//   String dateOfCreation;
//   String description;

// }

// Struct ImagePG{
//   ImagePG();
//   String photoURL;
//   ImageDataPG imageData;

// }