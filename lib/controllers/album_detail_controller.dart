import 'package:dio/dio.dart';
import 'package:photo_gallery/models/album.dart';
import 'package:photo_gallery/models/list_media_item.dart';
import 'package:photo_gallery/services/apis/google_photo_apis.dart';
import 'package:photo_gallery/utils/constants/index.dart';

class AlbumDetailController extends GetxController {
  final isLoadingPage = false.obs;
  final listMediaItems = ListMediaItems([], '').obs;
  final Album album = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  Future<void> _fetchData() async {
    isLoadingPage.value = true;
    try {
      listMediaItems.value = await GooglePhotoApis().searchMediaItems(album.id);
    } on DioError catch (err) {
      print(err);
    } catch (err) {
      print(err);
    } finally {
      isLoadingPage.value = false;
    }
  }
}
