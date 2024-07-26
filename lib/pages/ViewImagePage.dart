import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PostogramImage.dart';

class ViewImagePage extends StatelessWidget {
  const ViewImagePage({super.key, required this.photoData});
  final PhotoData photoData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: InteractiveViewer(
          maxScale: 5.0,
          minScale: 0.1,
          boundaryMargin: const EdgeInsets.all(0.0),
          child: PostogramImage(
            photoData: photoData,
            boxFit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
