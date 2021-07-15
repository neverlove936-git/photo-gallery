import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:photo_gallery/models/album.dart';
import 'package:photo_gallery/models/list_albums.dart';
import 'package:photo_gallery/models/list_media_item.dart';
import 'package:photo_gallery/models/new_media_item.dart';
import 'package:photo_gallery/services/dio.dart';
import 'package:photo_gallery/services/google_sign_in.dart';
import 'package:photo_gallery/utils/constants/index.dart';
import 'package:path/path.dart' as path;

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
        'excludeNonAppCreatedData': true,
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

  Future<ListMediaItems> searchMediaItems(String albumId) async {
    final Response response = await dioService(
      path: ApiResource.searchMedia,
      method: ApiResource.post,
      body: {
        'albumId': albumId,
      },
      authHeader: await googleSignInServices.authHeaders!,
    );
    return ListMediaItems.fromJson(response.data);
  }

  /// https://developers.google.com/photos/library/guides/upload-media

  Future<String> uploadPicture(File image) async {
    // Get the filename of the image
    final filename = path.basename(image.path);
    final binaryImage = await image.readAsBytes();

    final response = await dioService(
      method: ApiResource.post,
      authHeader: {
        ...await googleSignInServices.authHeaders!,
        'Content-type': 'application/octet-stream',
        'X-Goog-Upload-Protocol': 'raw',
        'X-Goog-Upload-File-Name': filename,
      },
      path: ApiResource.uploads,
      body: Stream.fromIterable(binaryImage.map((e) => [e])),
    );
    return response.data;
  }

  Future<BatchCreateMediaItemsResponse> batchCreateMediaItems(
      BatchCreateMediaItemsRequest request) async {
    final response = await dioService(
      method: ApiResource.post,
      authHeader: {
        ...await googleSignInServices.authHeaders!,
        'Content-type': 'application/json',
      },
      path: ApiResource.batchCreate,
      body: jsonEncode(request),
    );

    return BatchCreateMediaItemsResponse.fromJson(response.data);
  }
}
