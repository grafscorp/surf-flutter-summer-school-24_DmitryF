// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';
//import 'package:surf_flutter_summer_school_24/postgramAPI/PostgramAPI.dart';

import 'package:surf_flutter_summer_school_24/postgramAPI/models/PostogramImage.dart';

class CarouselPage extends StatefulWidget {
  final int indexPhoto;
  final List<PhotoData> listPhoto;
  const CarouselPage(
      {super.key, required this.indexPhoto, required this.listPhoto});

  @override
  State<CarouselPage> createState() {
    return _CarouselPageState();
  }
}

class _CarouselPageState extends State<CarouselPage> {
  //Variables
  late final List<PhotoData> listPhoto;
  late int _maxPhoto;
  late int _nowPhoto;
  late DateTime? _photoCreatedAt;

  final PageController _carouselController = PageController(
    viewportFraction: 0.8,
  );

  final coutPhotoFontSize = 20.0;

  @override
  void initState() {
    super.initState();
    listPhoto = widget.listPhoto;
    _nowPhoto = widget.indexPhoto;
    _photoCreatedAt = listPhoto.elementAt(_nowPhoto).createdAt;
    _maxPhoto = listPhoto.length;
    if (_nowPhoto > _maxPhoto) _nowPhoto = 0;
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        //Жду пока страница прогрузиться
        if (_carouselController.hasClients) {
          _carouselController.jumpToPage(_nowPhoto);
        }
      });
    });
  }

  //Widgets
  AppBar get _carouselAppBar => AppBar(
        centerTitle: true,
        title: Text(_photoCreatedAt != null
            ? DateFormat('dd-MM-yyyy').format(_photoCreatedAt!)
            : ""),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 26.0,
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 5),
              child: _countPhotoTitle),
        ],
      );
  //Информация о позиции текущей фотографии и общее кол-во
  Widget get _countPhotoTitle => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${_nowPhoto + 1}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: coutPhotoFontSize),
          ),
          Text("/$_maxPhoto", style: TextStyle(fontSize: coutPhotoFontSize)),
        ],
      );

  void updatePhotoData(int indexPhoto) {
    setState(() {
      _nowPhoto = indexPhoto;
      _photoCreatedAt = listPhoto.elementAt(_nowPhoto).createdAt;
    });
  }

  //override Methods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _carouselAppBar,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 40.0, 2.0, 80.0),
          child: _carouselPhotoView(),
        ));
  }

  Widget _carouselPhotoView() => PageView.builder(
        itemCount: listPhoto.length,
        itemBuilder: (context, photoId) {
          bool isActivePhoto = photoId == (_nowPhoto);
          //Анимация для слайда изображений
          return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
              margin: EdgeInsets.only(
                  left: isActivePhoto ? 0 : 10,
                  top: isActivePhoto ? 0 : 40,
                  right: isActivePhoto ? 0 : 10,
                  bottom:
                      isActivePhoto ? 0 : 40), // all(_isActivePhoto ? 10 : 20),
              child: _imageCard(photoId));
        },
        pageSnapping: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _carouselController,
        onPageChanged: (int newPage) {
          updatePhotoData(newPage);
        },
      );
  //Форма для вывода изображений
  Widget _imageCard(index) {
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        child: PostogramImage(photoData: listPhoto.elementAt(index)));
  }
}
