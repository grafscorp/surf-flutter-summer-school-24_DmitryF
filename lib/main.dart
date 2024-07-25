import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/pages/HomePage.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/bloc/postImage/ImagePostBloc.dart';
import 'package:surf_flutter_summer_school_24/themes/ThemeProvider.dart';
import 'package:surf_flutter_summer_school_24/themes/Themedark.dart';
import 'package:surf_flutter_summer_school_24/themes/Themelight.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePostBloc(),
      child: ChangeNotifierProvider(
        create: (context) => Themeprovider()..init(),
        child: Consumer<Themeprovider>(
          builder: (context, Themeprovider notifier, child) => MaterialApp(
            theme: notifier.isDark ? darkTheme() : lightTheme(),
            debugShowCheckedModeBanner: false,
            home: const Center(
              child: HomePage(),
            ),
          ),
        ),
      ),
    );
  }
}
