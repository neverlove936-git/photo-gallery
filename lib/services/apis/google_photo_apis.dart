import 'dart:convert';

import 'package:dio/dio.dart';
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
    print(response.data);
    return ListAlbums.fromJson(response.data);
  }
}
