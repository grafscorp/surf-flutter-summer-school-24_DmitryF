// ignore_for_file: file_names

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

  ///Override Methods
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          crossAxisCount: 3,
        ),
        itemCount: listPhoto.length,
        itemBuilder: (context, index) {
          return _photoContainer(index);
        });
  }

  Widget _photoContainer(int index) {
    const photoSize = Size(116, 116);
    return SizedBox(
        height: photoSize.height,
        width: photoSize.width,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CarouselPage(indexPhoto: index, listPhoto: listPhoto)));
          },
          child: listPhoto.length > 0
              ? PostogramImage(
                  photoData: listPhoto.elementAt(index),
                )
              : null,
        ));
  }
}
