// ignore_for_file: file_names

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/pages/CarouselPage.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PostogramImage.dart';

class GalleryPage extends StatefulWidget {
  final List<PhotoData> listPhoto;
  const GalleryPage({super.key, required this.listPhoto});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  //Get data gallery
  //List<Image> gallery = PostgramAPI.getImagesFromAccount();
  late final List<PhotoData> listPhoto;

  @override
  void initState() {
    super.initState();
    listPhoto = widget.listPhoto;
  }

  var maxCrossAxisEventItems = 125.0;

  ///Override Methods
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleEnd: (ScaleEndDetails scaleDetails) {
        setState(() {
          print("OK");
          if (scaleDetails.scaleVelocity < 0.0 &&
              maxCrossAxisEventItems < 500) {
            maxCrossAxisEventItems + 125;
          } else if (scaleDetails.scaleVelocity > 0.0 &&
              maxCrossAxisEventItems >= 250) maxCrossAxisEventItems - 125;
        });
      },
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 3,
          crossAxisSpacing: 3, maxCrossAxisExtent: maxCrossAxisEventItems,
          //crossAxisCount: gridItems,
        ),
        itemCount: listPhoto.length,
        itemBuilder: (context, index) {
          return _photoContainer(index);
        },
      ),
    );
  }

  Widget _photoContainer(int index) {
    const photoSize = Size(116, 116);
    return SizedBox(
      //     height: photoSize.height,
      // width: photoSize.width,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CarouselPage(indexPhoto: index, listPhoto: listPhoto)));
        },
        child: PostogramImage(
          photoData: listPhoto.elementAt(index),
        ),
      ),
    );
  }
}
