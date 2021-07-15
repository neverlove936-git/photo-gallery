import 'package:flutter/material.dart';
import 'package:photo_gallery/controllers/home_controller.dart';
import 'package:photo_gallery/models/album.dart';
import 'package:photo_gallery/routes/routes.dart';
import 'package:photo_gallery/utils/constants/index.dart';
import 'package:photo_gallery/views/widgets/loading.dart';

class ListAlbumsView extends StatelessWidget {
  ListAlbumsView({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchListAlbums(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        }
        if (snapshot.hasData) {
          return _albumListContent();
        }
        return Center(
          child: Text(
            'Has Error',
            style: TextThemeStyles.defaultTextBold,
          ),
        );
      },
    );
  }

  Widget _albumListContent() {
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
            ),
            itemCount: controller.listAlbums.value.albums != null
                ? controller.listAlbums.value.albums!.length + 1
                : 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _createAlbumItem();
              }
              final item = controller.listAlbums.value.albums![index - 1];
              return _albumItem(item);
            },
          ),
        );
      },
    );
  }

  Widget _albumItem(Album? item) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.albumDetail, arguments: item),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(item!.coverPhotoBaseUrl!),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            item.title,
            style: TextThemeStyles.defaultTextBold,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            item.mediaItemsCount != null
                ? 'albumItemCount'.trParams(
                    {
                      'itemCount': item.mediaItemsCount!,
                    },
                  )!
                : '',
            style: TextThemeStyles.defaultText.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAlbumItem() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.createAlbum);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Icon(Icons.add),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'newAlbum'.tr,
            style: TextThemeStyles.defaultTextBold,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '',
            style: TextThemeStyles.defaultText.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
