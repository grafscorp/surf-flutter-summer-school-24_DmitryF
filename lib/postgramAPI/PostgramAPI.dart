// ignore_for_file: file_names
//Test lib

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
//End Test Lib

import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoRepository.dart';

class PostgramAPI implements PhotoRepository {
  //Test
  // final _serverURL = "disk.yandex.ru";
  // final _apiKey =
  //     
  // final _pathPhoto = "/client/disk/Photos";

  final _serverURL = "cloud-api.yandex.net";
  final _apiKey =
      "y0_AgAAAAB3JWdHAADLWwAAAAELc7J1AAASA6Ubh-VKjYlQdY53QCRmc1gEmw";
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
        },
      ),
      headers: {
        HttpHeaders.authorizationHeader: 'OAuth $_apiKey',
      },
    );

    var jsonPhotoData =
        jsonDecode(postgramPhotosResponse.body) as Map<String, dynamic>;
    print(jsonPhotoData['items'][0]['created']);
    int i = 0;
    for (Map<String, dynamic> photoJson in jsonPhotoData['items']) {
      final photo = PhotoData(
        id: 1,
        url: jsonPhotoData['items'][i]['sizes'][0]['url'],
        //url: photoJson[i]['sizes'][0]['url'],
        createdAt: DateFormat("yyyy-MM-dd")
            .parse(jsonPhotoData['items'][0]['created'].toString()),
      );
      i++;
      photoList.add(photo);
    }

    return photoList;
  }

  @override
  Future<bool> postPhoto(XFile newPhoto) async {
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
    Dio().put(linkToUpload, data: formData);
    return true;
  }

  //Download Photo
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
