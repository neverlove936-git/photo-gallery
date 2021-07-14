// Cores
import 'dart:async';
import 'dart:io';
// Utils
import 'package:get/get.dart';
import 'package:photo_gallery/routes/routes.dart';
import 'package:photo_gallery/services/cache/shared_preferences_service.dart';
import 'package:photo_gallery/services/google_sign_in.dart';
import 'package:photo_gallery/utils/constants/index.dart';
// Services
// Utils

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _delayScreen();
  }

  Future _delayScreen() async {
    await SharedPreferencesServices().setPrefInstance();
    final googleSignInServices = GoogleSignInServices();
    await googleSignInServices.signInSilently();
    await Future.delayed(Duration(microseconds: 1000));
    // ignore: unawaited_futures
    Get.offAndToNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Platform.isAndroid ? true : false;
      },
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(
              ImagesUrls.splashScreen,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
