import 'package:flutter/material.dart';

class PostgramAPI {
  static List<Widget> getAllPhotoFromAccount() {
    return <Widget>[
      getImageWithPadding(
          "https://s1.1zoom.ru/big3/984/Canada_Parks_Lake_Mountains_Forests_Scenery_Rocky_567540_3840x2400.jpg"),
      getImageWithPadding(
          "https://i.pinimg.com/736x/68/bb/9f/68bb9fa7c140101cafb7d91044e2d53b.jpg"),
      getImageWithPadding(
          "https://get.pxhere.com/photo/man-person-girl-woman-camera-photography-dslr-portrait-spring-red-lens-color-autumn-canon-romance-season-taking-photo-photograph-beauty-emotion-photo-shoot-portrait-photography-939435.jpg"),
      getImageWithPadding(
          "https://get.pxhere.com/photo/person-girl-woman-night-camera-photography-photographer-portrait-red-color-canon-fashion-shooting-singing-photograph-tr-nh-patience-s-kien-flash-light-human-positions-1207048.jpg"),
      getImageWithPadding(
          "https://get.pxhere.com/photo/person-girl-woman-night-camera-photography-photographer-portrait-red-color-canon-fashion-shooting-singing-photograph-tr-nh-patience-s-kien-flash-light-human-positions-1207048.jpg"),
    ];
  }

  static getImageWithPadding(String photoUrl) => Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Image.network(
        photoUrl,
        fit: BoxFit.cover,
      ));
  //ExtendedImage()
}
