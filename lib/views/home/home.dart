import 'package:photo_gallery/controllers/home_controller.dart';
import 'package:photo_gallery/utils/constants/index.dart';
import 'package:photo_gallery/views/home/list_albums_view.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: _homeAppBar(),
      ),
      body: _homeBody(),
    );
  }

  Widget _homeAppBar() {
    return AppBar(
      elevation: 5,
      title: Text(
        'homeTitle'.tr,
        style: TextThemeStyles.appBarTitle,
      ),
      centerTitle: true,
      leading: SizedBox(),
    );
  }

  Widget _homeBody() {
    return Obx(() {
      return controller.isLoggedIn.value ? ListAlbumsView() : _signInButton();
    });
  }

  Widget _signInButton() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
        ),
        onPressed: () async {
          await controller.googleSignIn();
        },
        child: Text(
          'signInGoogle'.tr,
          style: TextThemeStyles.btnTextMedium,
        ),
      ),
    );
  }
}
