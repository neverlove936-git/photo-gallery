import 'package:photo_gallery/controllers/home_controller.dart';
import 'package:photo_gallery/models/album.dart';
import 'package:photo_gallery/routes/routes.dart';
import 'package:photo_gallery/services/apis/google_photo_apis.dart';
import 'package:photo_gallery/utils/constants/index.dart';

class CreateAlbumController extends GetxController {
  final TextEditingController albumFormFieldController =
      TextEditingController();
  final isLoading = false.obs;
  final isDisableButton = true.obs;
  final HomeController homeController = Get.find();

  Future<void> createAlbum() async {
    // Display Loading
    isLoading.value = true;
    Album newAlbum;
    try {
      newAlbum = await GooglePhotoApis()
          .createAlbum(albumFormFieldController.text.trim());
    } catch (err) {
      print(err);
      // Remove Loading
      isLoading.value = false;
      return;
    }
    // Remove Loading
    isLoading.value = false;
    // ignore: unawaited_futures
    homeController.fetchListAlbums();
    // ignore: unawaited_futures
    Get.offAndToNamed(Routes.albumDetail, arguments: newAlbum);
  }

  void checkValidButton() {
    isDisableButton.value = albumFormFieldController.text.trim().isEmpty;
  }
}
