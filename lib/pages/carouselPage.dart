import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/postgramAPI.dart';

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

  PageController _carouselController = PageController(
    viewportFraction: 0.8,
  );

  final coutPhotoFontSize = 20.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _gallery = PostgramAPI.getImagesFromAccount();
      _maxPhoto = _gallery?.length;
      // if (_carouselController.hasClients) {
      //   _carouselController.jumpToPage(_nowPhoto ?? 0);
      // }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_carouselController.hasClients) {
          _carouselController.jumpToPage(_nowPhoto ?? 0);
        }
      });
    });
  }

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
        itemBuilder: (context, _photoId) {
          bool _isActivePhoto = _photoId == (_nowPhoto);
          return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
              margin: EdgeInsets.all(_isActivePhoto ? 10 : 20),
              child: _imageCard(_photoId));
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

  Widget _imageCard(index) {
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: _gallery?.elementAt(index));
  }
}
