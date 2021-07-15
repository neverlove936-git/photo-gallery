import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_gallery/models/list_media_item.dart';
import 'package:photo_gallery/routes/routes.dart';
import 'package:photo_gallery/utils/constants/index.dart';

class ListImage extends StatelessWidget {
  ListImage({Key? key, this.listMediaItems}) : super(key: key);

  final ListMediaItems? listMediaItems;
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.symmetric(vertical: 20),
      crossAxisCount: 4,
      itemBuilder: (context, index) {
        final item = listMediaItems?.mediaItems?[index];
        return GestureDetector(
          onTap: () => Get.toNamed(Routes.imageDetail,
              arguments: item!.baseUrl ?? item.productUrl),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  item!.baseUrl ?? item.productUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      itemCount: listMediaItems?.mediaItems?.length,
      staggeredTileBuilder: (index) {
        final item = listMediaItems?.mediaItems?[index];
        return StaggeredTile.count(
          2,
          2 *
              int.parse(item!.mediaMetadata.height) /
              int.parse(item.mediaMetadata.width),
        );
      },
    );
  }
}
