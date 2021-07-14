import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/utils/language/en/index.dart';

class AppTranslations extends Translations {
  // Default locale
  static final locale = Locale('en', '');
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUS,
      };
}
