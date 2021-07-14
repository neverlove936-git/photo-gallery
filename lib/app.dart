import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/routes/pages.dart';
import 'package:photo_gallery/services/app_translation.dart';
import 'package:photo_gallery/utils/constants/index.dart';
import 'package:photo_gallery/views/splash/splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      title: 'Photo Gallery',
      theme: buildThemeData(),
      locale: AppTranslations.locale,
      home: SplashScreen(),
      getPages: listPage,
    );
  }
}
