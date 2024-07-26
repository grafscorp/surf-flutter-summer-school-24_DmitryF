// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoRepository.dart';

class PostgramAPI implements PhotoRepository {
  final _serverURL = "cloud-api.yandex.net";
  final _apiKey = "Write ur API";
  final _postPathPhoto = "v1/disk/resources/upload";
  final _getPhotoPath = 'v1/disk/resources/files';

  @override
  Future<List<PhotoData>> getPhotos() async {
    List<PhotoData> photoList = [];

    var postgramPhotosResponse = await http.get(
      Uri.https(
        _serverURL,
        _getPhotoPath,
        {
          'path': '1',
          'limit': '200',
        },
      ),
      headers: {
        HttpHeaders.authorizationHeader: 'OAuth $_apiKey',
      },
    );

    Map<String, dynamic> jsonPhotoData =
        jsonDecode(postgramPhotosResponse.body) as Map<String, dynamic>;
    for (Map<String, dynamic> photoJson in jsonPhotoData['items']) {
      final photo = PhotoData(
        id: 1,
        url: photoJson['sizes'][0]['url'],
        createdAt:
            DateFormat("yyyy-MM-dd").parse(photoJson['created'].toString()),
      );

      photoList.add(photo);
    }

    return photoList;
  }

  @override
  Future<bool> postPhoto(XFile newPhoto) async {
    try {
      var postogramPhotoResponse = await http.get(
        Uri.https(
          _serverURL,
          _postPathPhoto,
          {"path": newPhoto.name},
        ),
        headers: {
          HttpHeaders.authorizationHeader: 'OAuth $_apiKey',
        },
      );

      final phohoJson =
          jsonDecode(postogramPhotoResponse.body) as Map<String, dynamic>;
      final linkToUpload = phohoJson['href'] as String;

      final file = File(newPhoto.path);

      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
      });
      await Dio().put(linkToUpload, data: formData);
      return true;
    } catch (e) {
      return false;
    }
  }
}
