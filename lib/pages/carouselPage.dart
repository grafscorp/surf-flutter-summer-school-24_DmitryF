// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/postgramAPI.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  //Variables
  String? _datePhoto;

  List<Widget>? _gallery;

  int? _maxPhoto;
  int? _nowPhoto;

  final PageController _carouselController = PageController(
    viewportFraction: 0.8,
  );

  final coutPhotoFontSize = 20.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _gallery = PostgramAPI.getAllPhotoFromAccount();
      _maxPhoto = _gallery?.length;
      _nowPhoto = _carouselController.initialPage;
    });
  }

  //Widgets
  AppBar get _carouselAppBar => AppBar(
        centerTitle: true,
        title: Text("$_datePhoto"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            size: 26.0,
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 5),
              child: _CountPhotoTitle),
        ],
      );

  Widget get _CountPhotoTitle => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${_nowPhoto! + 1}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: coutPhotoFontSize),
          ),
          Text("/${_maxPhoto}", style: TextStyle(fontSize: coutPhotoFontSize)),
        ],
      );

  //override Methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _carouselAppBar,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 40.0, 2.0, 80.0),
          child: _CarouselPhotoView(),
        ));
  }

  Widget _CarouselPhotoView() => PageView.builder(
        itemCount: _gallery?.length ?? 1,
        itemBuilder: (context, _pageId) {
          bool _isActivePhoto = _pageId == (_nowPhoto);
          return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
              margin: EdgeInsets.all(_isActivePhoto ? 10 : 20),
              child: _gallery?.elementAt(_pageId));
          // return _gallery
          //     ?.elementAt(_pageId); //[const CircularProgressIndicator()];
        },
        pageSnapping: true,

        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _carouselController,
        // children: _gallery ?? [const CircularProgressIndicator()],
        onPageChanged: (int newPage) {
          setState(() {
            _nowPhoto = newPage;
          });
        },
      );
}
