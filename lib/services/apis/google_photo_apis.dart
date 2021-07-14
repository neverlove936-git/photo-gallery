import 'package:dio/dio.dart';
import 'package:photo_gallery/models/album.dart';
import 'package:photo_gallery/models/list_albums.dart';
import 'package:photo_gallery/services/dio.dart';
import 'package:photo_gallery/services/google_sign_in.dart';
import 'package:photo_gallery/utils/constants/index.dart';

class GooglePhotoApis {
  /// Resource
  /// https://developers.google.com/photos/library/reference/rest
  ///
  final googleSignInServices = GoogleSignInServices();

  Future<ListAlbums> listAlbums() async {
    final Response response = await dioService(
      path: ApiResource.albums,
      params: {
        'pageSize': 50,
        'excludeNonAppCreatedData': false,
      },
      authHeader: await googleSignInServices.authHeaders!,
    );
    return ListAlbums.fromJson(response.data);
  }

  Future<Album> createAlbum(String title) async {
    final Response response = await dioService(
      path: ApiResource.albums,
      method: ApiResource.post,
      body: {
        'album': {
          'title': title,
        },
      },
      authHeader: await googleSignInServices.authHeaders!,
    );

    return Album.fromJson(response.data);
  }
}
