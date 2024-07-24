// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/PostgramAPI.dart';

class CarouselPage extends StatefulWidget {
  final int indexPhoto;
  const CarouselPage({super.key, required this.indexPhoto});

  @override
  State<CarouselPage> createState() => _CarouselPageState(indexPhoto);
}

class _CarouselPageState extends State<CarouselPage> {
  _CarouselPageState(indexPhoto) {
    _nowPhoto = indexPhoto;
  }

  //Variables
  String? _datePhoto;

  List<Widget>? _gallery;

  int? _maxPhoto;
  int? _nowPhoto;

  final PageController _carouselController = PageController(
    viewportFraction: 0.8,
  );

  final coutPhotoFontSize = 20.0;

  //Widgets
  AppBar get _carouselAppBar => AppBar(
        centerTitle: true,
        title: Text("$_datePhoto"),
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
            "${_nowPhoto! + 1}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: coutPhotoFontSize),
          ),
          Text("/$_maxPhoto", style: TextStyle(fontSize: coutPhotoFontSize)),
        ],
      );

  //override Methods
  @override
  void initState() {
    super.initState();
    setState(() {
      _gallery = PostgramAPI.getImagesFromAccount();
      _maxPhoto = _gallery?.length;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        //Жду пока страница прогрузиться
        if (_carouselController.hasClients) {
          _carouselController.jumpToPage(_nowPhoto ?? 0);
        }
      });
    });
  }

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
        itemCount: _gallery?.length ?? 1,
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
          setState(() {
            _nowPhoto = newPage;
          });
        },
      );
  //Форма для вывода изображений
  Widget _imageCard(index) {
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        child: _gallery?.elementAt(index));
  }
}
