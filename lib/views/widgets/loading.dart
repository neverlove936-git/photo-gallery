import 'package:flutter/material.dart';
import 'package:photo_gallery/utils/constants/index.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(TextThemeColors.blue),
      ),
    );
  }
}
