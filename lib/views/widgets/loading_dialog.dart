import 'package:flutter/material.dart';
import 'package:photo_gallery/utils/constants/colors.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(TextThemeColors.blue),
      ),
    );
  }
}
