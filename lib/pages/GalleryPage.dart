// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/pages/CarouselPage.dart';
import 'package:surf_flutter_summer_school_24/pages/FailedLoadPage.dart';
import 'package:surf_flutter_summer_school_24/pages/ThemeBottomSheet.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PostgramPhotoController.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PostogramImage.dart';
import 'package:surf_flutter_summer_school_24/themes/ThemeProvider.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  //Get data gallery
  //List<Image> gallery = PostgramAPI.getImagesFromAccount();

  String titleImageLightDirectory = "assets/images/titlePGlight.png";
  String titleImageDarkDirectory = "assets/images/titlePGdark.png";

  @override
  void initState() {
    super.initState();
    PostgramPhotoController.updatePhotoList();
  }

  ///Override Methods
  @override
  Widget build(BuildContext context) {
    return Consumer<Themeprovider>(
        builder: (context, Themeprovider notifier, child) {
      return Scaffold(
          appBar: _galleryAppBar(isDarkTheme: notifier.isDark),
          body:
              // Padding(
              //     padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
              //     child: _galleryGrid)
              //Test Without Connetction Check
              FutureBuilder(
                  future: PostgramPhotoController.updatePhotoList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                          child: _galleryGrid);
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return const FailedLoadPage();
                    } else {
                      return const Center(
                        child: //FailedLoadPage()
                            CircularProgressIndicator(),
                      );
                    }
                  }));
    });
  }

  ///App Bar
  AppBar _galleryAppBar({bool isDarkTheme = false}) => AppBar(
        centerTitle: true,
        title: Image.asset(
          isDarkTheme ? titleImageDarkDirectory : titleImageLightDirectory,
          //height: 60,
          width: 160,
        ),
        actions: [_settingsAppBarButton],
      );

  void _showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => MenuBottomSheet());
  }

  IconButton get _settingsAppBarButton => IconButton(
      onPressed: () {
        _showThemeBottomSheet(context);
      },
      icon: const Icon(
        Icons.more_vert_outlined,
        size: 28,
      ));

  //Gallery Grid
  Widget get _galleryGrid => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        crossAxisCount: 3,
      ),
      itemCount: PostgramPhotoController.photoList.length,
      itemBuilder: (context, index) {
        return _photoContainer(index);
      });

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
                    builder: (context) => CarouselPage(
                          indexPhoto: index,
                        )));
          },
          child: PostogramImage(
            photoData: PostgramPhotoController.photoList.elementAt(index),
          ),
        ));
  }
}
