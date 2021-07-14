import 'package:flutter/material.dart';
import 'package:photo_gallery/controllers/home_controller.dart';
import 'package:photo_gallery/models/album.dart';
import 'package:photo_gallery/utils/constants/index.dart';

class ListAlbumsView extends StatelessWidget {
  ListAlbumsView({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchListAlbums(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(TextThemeColors.blue),
            ),
          );
        }
        if (snapshot.hasData) {
          return _albumListContent();
        }
        return Center(
          child: Text('Has Error'),
        );
      },
    );
  }

  Widget _albumListContent() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
        itemCount: controller.listAlbums.value.albums!.length,
        itemBuilder: (context, index) {
          final item = controller.listAlbums.value.albums![index];
          return _albumItem(item);
        },
      ),
    );
  }

  Widget _albumItem(Album? item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(item!.coverPhotoBaseUrl),
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
    );
  }
}
