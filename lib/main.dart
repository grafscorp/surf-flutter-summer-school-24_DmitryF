import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/pages/GalleryPage.dart';
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
    return ChangeNotifierProvider(
        create: (context) => Themeprovider()..init(),
        child: Consumer<Themeprovider>(
          builder: (context, Themeprovider notifier, child) => MaterialApp(
            theme: notifier.isDark ? darkTheme() : lightTheme(),
            debugShowCheckedModeBanner: false,
            home: const Scaffold(
              body: Center(
                child: GalleryPage(),
              ),
            ),
          ),
        ));
  }
}
