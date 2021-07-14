import 'package:flutter/material.dart';
import 'package:photo_gallery/controllers/album_detail_controller.dart';
import 'package:photo_gallery/models/album.dart';
import 'package:photo_gallery/utils/constants/index.dart';
import 'package:photo_gallery/views/album/list_image.dart';
import 'package:photo_gallery/views/widgets/default_icon_button.dart';
import 'package:photo_gallery/views/widgets/loading.dart';

class AlbumDetail extends StatelessWidget {
  AlbumDetail({
    Key? key,
  }) : super(key: key);

  final Album album = Get.arguments;
  final AlbumDetailController controller = Get.put(AlbumDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: _appBar(),
      ),
      body: _bodyContent(),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 5,
      title: Text(
        album.title,
        style: TextThemeStyles.appBarTitle,
      ),
      centerTitle: true,
    );
  }

  Widget _bodyContent() {
    return Obx(
      () {
        return controller.isLoadingPage.value
            ? LoadingIndicator()
            : ListImage(
                listMediaItems: controller.listMediaItems.value,
              );
      },
    );
  }
}
