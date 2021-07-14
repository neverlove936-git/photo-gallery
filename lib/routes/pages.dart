import 'package:get/get.dart';
import 'package:photo_gallery/routes/routes.dart';
import 'package:photo_gallery/views/home/home.dart';
import 'package:photo_gallery/views/splash/splash.dart';

List<GetPage> listPage = [
  GetPage(name: Routes.home, page: () => Home()),
  GetPage(
    name: Routes.splashScreen,
    page: () => SplashScreen(),
  ),
];
