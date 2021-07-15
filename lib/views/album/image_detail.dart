import 'package:flutter/material.dart';
import 'package:photo_gallery/utils/constants/index.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetail extends StatelessWidget {
  ImageDetail({Key? key}) : super(key: key);

  final String imageUrl = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoView(
          imageProvider: NetworkImage(imageUrl),
        ),
      ],
    );
  }
}
