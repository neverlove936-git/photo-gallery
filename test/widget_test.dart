// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:photo_gallery/utils/constants/index.dart';
import 'package:photo_gallery/views/splash/splash.dart';

void main() {
  testWidgets('Splash test', (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(),
          child: GetMaterialApp(
            home: SplashScreen(),
          ),
        ),
      );
      expect(findByAssetImagePathTypeContainer('assets/images/splash.png'),
          findsOneWidget);
    });
  });
}

Finder findByAssetImagePathTypeContainer(String path) => find.byWidgetPredicate(
      (widget) {
        if (widget is Container && widget.decoration is BoxDecoration) {
          final boxDecoration = widget.decoration as BoxDecoration;
          if (boxDecoration.image is DecorationImage &&
              boxDecoration.image?.image is AssetImage) {
            final assetImage = boxDecoration.image?.image as AssetImage;
            return assetImage.assetName == path;
          }
        }

        return false;
      },
    );
