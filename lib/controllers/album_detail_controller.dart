import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_gallery/controllers/home_controller.dart';
import 'package:photo_gallery/models/album.dart';
import 'package:photo_gallery/models/list_media_item.dart';
import 'package:photo_gallery/models/new_media_item.dart';
import 'package:photo_gallery/services/apis/google_photo_apis.dart';
import 'package:photo_gallery/utils/constants/index.dart';
import 'package:path/path.dart' as path;
import 'package:photo_gallery/views/widgets/loading_dialog.dart';

class AlbumDetailController extends GetxController {
  final isLoadingPage = false.obs;
  final listMediaItems = ListMediaItems([], '').obs;
  final Album album = Get.arguments;
  final _imagePicker = ImagePicker();
  bool hasUploaded = false;
  final HomeController homeController = Get.find();

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  @override
  void onClose() {
    super.onClose();
    if (hasUploaded) {
      homeController.fetchListAlbums();
    }
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

  Future<void> pickImage() async {
    final pickedImage =
        await _imagePicker.getImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    }
    final pickedFile = File(pickedImage.path);
    await uploadImage(pickedFile);
  }

  Future<void> uploadImage(File pickedFile) async {
    // Get upload token after upload the image to Google Photos success.
    String uploadToken;
    // Display loading
    // ignore: unawaited_futures
    Get.dialog(
      LoadingDialog(),
      barrierDismissible: false,
    );
    try {
      uploadToken = await GooglePhotoApis().uploadPicture(pickedFile);
    } catch (err) {
      print(err);
      return;
    }
    final request = BatchCreateMediaItemsRequest.inAlbum(
      uploadToken,
      album.id,
      'test',
      path.basename(pickedFile.path),
    );
    // Create a media item after upload.
    try {
      await GooglePhotoApis().batchCreateMediaItems(request);
    } catch (err) {
      print(err);
      return;
    }

    hasUploaded = true;
    // Close loading
    Get.back();

    /// Refresh to get new image from album.
    try {
      listMediaItems.value = await GooglePhotoApis().searchMediaItems(album.id);
    } on DioError catch (err) {
      print(err);
    } catch (err) {
      print(err);
    }
  }
}
