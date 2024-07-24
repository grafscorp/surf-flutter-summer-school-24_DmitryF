// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PostgramAPI {
  //get image methods 2

  static getImagesFromAccount() {
    return <Image>[
      _getImageNetworkSctrech(
          "https://s1.1zoom.ru/big3/984/Canada_Parks_Lake_Mountains_Forests_Scenery_Rocky_567540_3840x2400.jpg"),
      _getImageNetworkSctrech(
          "https://i.pinimg.com/736x/68/bb/9f/68bb9fa7c140101cafb7d91044e2d53b.jpg"),
      _getImageNetworkSctrech(
          "https://get.pxhere.com/photo/man-person-girl-woman-camera-photography-dslr-portrait-spring-red-lens-color-autumn-canon-romance-season-taking-photo-photograph-beauty-emotion-photo-shoot-portrait-photography-939435.jpg"),
      _getImageNetworkSctrech(
          "https://get.pxhere.com/photo/person-girl-woman-night-camera-photography-photographer-portrait-red-color-canon-fashion-shooting-singing-photograph-tr-nh-patience-s-kien-flash-light-human-positions-1207048.jpg"),
      _getImageNetworkSctrech(
        "https://s1.1zoom.ru/big3/984/Canada_Parks_Lake_Mountains_Forests_Scenery_Rocky_567540_3840x2400.jpg",
      ),
    ];
  }

  static Image _getImageNetworkSctrech(String url,
      {BoxFit fit = BoxFit.cover}) {
    return Image.network(
      url,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 63, 63, 63),
                Color.fromARGB(255, 185, 183, 183)
              ],
            )),
          );
        }
      },
    );
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