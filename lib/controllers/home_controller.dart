import 'package:photo_gallery/models/list_albums.dart';
import 'package:photo_gallery/services/apis/google_photo_apis.dart';
import 'package:photo_gallery/services/google_sign_in.dart';
import 'package:photo_gallery/utils/constants/index.dart';
import 'package:photo_gallery/views/widgets/custom_dialog.dart';

class HomeController extends GetxController {
  final googleSignInServices = GoogleSignInServices();

  final isLoggedIn = false.obs;
  final listAlbums = ListAlbums([], '').obs;

  @override
  void onInit() {
    super.onInit();
    getIsLoggedIn();
  }

  void getIsLoggedIn() {
    isLoggedIn.value = googleSignInServices.isLoggedIn();
  }

  Future<ListAlbums> fetchListAlbums() async {
    try {
      listAlbums.value = await GooglePhotoApis().listAlbums();
    } catch (e) {
      print(e);
    }
    return listAlbums.value;
  }

  Future<void> googleSignIn() async {
    try {
      await googleSignInServices.signIn();
    } on Exception catch (error) {
      print(error);
    }
    await Future.delayed(Duration(milliseconds: 500));
    getIsLoggedIn();
  }

  Future<void> logOut() async {
    final result = await Get.dialog(
      customDialog(
        btnOK: 'btnYes'.tr,
        content: 'confirmLogOut'.tr,
        btnCancel: 'btnNo'.tr,
        type: TypeDynamicDialog.confirm,
      ),
    );
    if (result == ActionDynamicDialog.ok) {
      await googleSignInServices.signOut();
    }
    await Future.delayed(Duration(milliseconds: 500));
    getIsLoggedIn();
  }
}
