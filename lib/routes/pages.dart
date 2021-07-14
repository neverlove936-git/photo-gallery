import 'package:get/get.dart';
import 'package:photo_gallery/routes/routes.dart';
import 'package:photo_gallery/views/album/album_detail.dart';
import 'package:photo_gallery/views/album/create_album.dart';
import 'package:photo_gallery/views/home/home.dart';
import 'package:photo_gallery/views/splash/splash.dart';

List<GetPage> listPage = [
  GetPage(name: Routes.home, page: () => Home()),
  GetPage(
    name: Routes.splashScreen,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: Routes.createAlbum,
    page: () => CreateAlbumPage(),
  ),
  GetPage(
    name: Routes.albumDetail,
    page: () => AlbumDetail(),
  ),
];
