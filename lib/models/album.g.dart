// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
    json['id'] as String,
    json['title'] as String,
    json['productUrl'] as String,
    json['isWriteable'] == null ? null : json['isWriteable'] as bool,
    json['shareInfo'] == null
        ? null
        : ShareInfo.fromJson(json['shareInfo'] as Map<String, dynamic>),
    json['mediaItemsCount'] == null ? null : json['mediaItemsCount'] as String,
    json['coverPhotoBaseUrl'] as String,
    json['coverPhotoMediaItemId'] == null
        ? null
        : json['coverPhotoMediaItemId'] as String,
  );
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'productUrl': instance.productUrl,
      'isWriteable': instance.isWriteable,
      'shareInfo': instance.shareInfo,
      'mediaItemsCount': instance.mediaItemsCount,
      'coverPhotoBaseUrl': instance.coverPhotoBaseUrl,
      'coverPhotoMediaItemId': instance.coverPhotoMediaItemId,
    };

ShareInfo _$ShareInfoFromJson(Map<String, dynamic> json) {
  return ShareInfo(
    SharedAlbumOptions.fromJson(
        json['sharedAlbumOptions'] as Map<String, dynamic>),
    json['shareableUrl'] as String,
    json['shareToken'] as String,
    json['isJoined'] as bool,
  );
}

Map<String, dynamic> _$ShareInfoToJson(ShareInfo instance) => <String, dynamic>{
      'sharedAlbumOptions': instance.sharedAlbumOptions,
      'shareableUrl': instance.shareableUrl,
      'shareToken': instance.shareToken,
      'isJoined': instance.isJoined,
    };

SharedAlbumOptions _$SharedAlbumOptionsFromJson(Map<String, dynamic> json) {
  return SharedAlbumOptions(
    json['isCollaborative'] as bool,
    json['isCommentable'] as bool,
  );
}

Map<String, dynamic> _$SharedAlbumOptionsToJson(SharedAlbumOptions instance) =>
    <String, dynamic>{
      'isCollaborative': instance.isCollaborative,
      'isCommentable': instance.isCommentable,
    };
