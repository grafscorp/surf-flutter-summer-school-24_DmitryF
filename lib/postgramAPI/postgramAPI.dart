import 'dart:ffi';

import 'package:flutter/material.dart';

class PostgramAPI {
  static List<Widget> getAllPhotoFromAccount() {
    return <Widget>[
      getImageCard(
          "https://s1.1zoom.ru/big3/984/Canada_Parks_Lake_Mountains_Forests_Scenery_Rocky_567540_3840x2400.jpg"),
      getImageCard(
          "https://i.pinimg.com/736x/68/bb/9f/68bb9fa7c140101cafb7d91044e2d53b.jpg"),
      getImageCard(
          "https://get.pxhere.com/photo/man-person-girl-woman-camera-photography-dslr-portrait-spring-red-lens-color-autumn-canon-romance-season-taking-photo-photograph-beauty-emotion-photo-shoot-portrait-photography-939435.jpg"),
      getImageCard(
          "https://get.pxhere.com/photo/person-girl-woman-night-camera-photography-photographer-portrait-red-color-canon-fashion-shooting-singing-photograph-tr-nh-patience-s-kien-flash-light-human-positions-1207048.jpg"),
      getImageCard(
          "https://get.pxhere.com/photo/person-girl-woman-night-camera-photography-photographer-portrait-red-color-canon-fashion-shooting-singing-photograph-tr-nh-patience-s-kien-flash-light-human-positions-1207048.jpg"),
    ];
  }

  static getImageCard(String photoUrl) => Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Image.network(
        photoUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.black, Colors.white],
              )),
            );
          }
        },
      ));
  //ExtendedImage()

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

  static Image _getImageNetworkSctrech(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
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