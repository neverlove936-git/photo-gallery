import 'package:photo_gallery/controllers/home_controller.dart';
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
    try {
      await GooglePhotoApis().createAlbum(albumFormFieldController.text.trim());
    } catch (err) {
      print(err);
      // Remove Loading
      isLoading.value = false;
      return;
    }
    await homeController.fetchListAlbums();
    // Remove Loading
    isLoading.value = false;
    Get.back();
  }

  void checkValidButton() {
    isDisableButton.value = albumFormFieldController.text.trim().isEmpty;
  }
}
