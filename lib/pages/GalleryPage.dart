// ignore_for_file: file_names

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart' as GetTransition;
import 'package:surf_flutter_summer_school_24/models/ImagePostDialog.dart';

import 'package:surf_flutter_summer_school_24/pages/CarouselPage.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/bloc/ImageList/ImageListBloc.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/bloc/postImage/ImagePostBloc.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PostogramImage.dart';

class GalleryPage extends StatefulWidget {
  late List<PhotoData> listPhoto;
  GalleryPage({super.key, required this.listPhoto});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  //Get data gallery
  //List<Image> gallery = PostgramAPI.getImagesFromAccount();
  late List<PhotoData> listPhoto;

  @override
  void initState() {
    super.initState();
    listPhoto = widget.listPhoto;
  }

  ///Override Methods
  @override
  Widget build(BuildContext context) {
    return BlocListener<ImagePostBloc, ImagePostState>(
      listener: (context, state) {
        if (state is ImagePostLoaded) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ImagePostDialog.getImagePostCompleteDialog(context);
            },
          );
        } else if (state is ImagePostEror) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ImagePostDialog.getImagePostFailedDialog(context);
            },
          );
        } else if (state is ImagePostInit) {
          return;
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ImagePostDialog.getImagePostLoadingDialog(context);
            },
          );
        }
      },
      child: BlocBuilder<ImageListBloc, ImageListBlocState>(
        builder: (context, state) {
          if (state is ImageListLoaded) {
            listPhoto = state.listPhotoData;
            return GestureDetector(
              onScaleEnd: (ScaleEndDetails scaleDetails) {
                setState(
                  () {},
                );
              },
              child: MasonryGridView.builder(
                cacheExtent: 600,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: listPhoto.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: _photoContainer(index),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _photoContainer(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: () {
          Get.to(() => CarouselPage(indexPhoto: index, listPhoto: listPhoto),
              transition: GetTransition.Transition.zoom);
        },
        child: PostogramImage(
          photoData: listPhoto.elementAt(index),
        ),
      ),
    );
  }
}
