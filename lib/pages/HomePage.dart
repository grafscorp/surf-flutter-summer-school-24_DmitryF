import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/buttons/SettingButton.dart';
import 'package:surf_flutter_summer_school_24/pages/FailedLoadPage.dart';
import 'package:surf_flutter_summer_school_24/pages/GalleryPage.dart';
import 'package:surf_flutter_summer_school_24/pages/ThemeBottomSheet.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/bloc/ImageListBloc.dart';
import 'package:surf_flutter_summer_school_24/themes/ThemeProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String titleImageLightDirectory = "assets/images/titlePGlight.png";
  final String titleImageDarkDirectory = "assets/images/titlePGdark.png";

  final _imageListBloc = ImageListBloc();
  @override
  void initState() {
    super.initState();
    _imageListBloc.add(LoadImageListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Themeprovider>(
        builder: (context, Themeprovider notifier, child) {
      return Scaffold(
        appBar: _builAppBar(notifier.isDark),
        body: BlocBuilder<ImageListBloc, ImageListBlocState>(
          bloc: _imageListBloc,
          builder: (context, state) {
            if (state is ImageListLoaded) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                child: GalleryPage(
                  listPhoto: state.listPhotoData,
                ),
              );
            } else if (state is ImageListFailed) {
              return const FailedLoadPage();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
    });
  }

  AppBar _builAppBar(bool isDarkTheme) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        isDarkTheme ? titleImageDarkDirectory : titleImageLightDirectory,
        //height: 60,
        width: 160,
      ),
      actions: const [SettingButton()],
    );
  }
}
