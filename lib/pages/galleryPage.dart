import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/pages/carouselPage.dart';
import 'package:surf_flutter_summer_school_24/pages/themeBottomSheet.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/postgramAPI.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  //Get data gallery
  List<Image> gallery = PostgramAPI.getImagesFromAccount();

  ///Override Methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _galleryAppBar,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 0), child: _galleryGrid),
    );
  }

  ///App Bar
  AppBar get _galleryAppBar => AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/titlePGdark.png",
          height: 960,
          width: 200,
        ),
        actions: [_settingsAppBarButton],
      );

  void _showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => Themebottomsheet());
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
      itemCount: gallery.length,
      itemBuilder: (context, index) {
        return _photoContainer(index);
      });

  Widget _photoContainer(int index) {
    const _photoSize = Size(116, 116);
    return SizedBox(
      height: _photoSize.height,
      width: _photoSize.width,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CarouselPage(
                        indexPhoto: index,
                      )));
        },
        child: gallery?.elementAt(index),
      ),
    );
  }
}
