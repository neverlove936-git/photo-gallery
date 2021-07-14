// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaItem _$MediaItemFromJson(Map<String, dynamic> json) {
  return MediaItem(
    json['id'] as String,
    json['productUrl'] as String,
    json['baseUrl'] as String,
    json['mimeType'] as String,
    json['filename'] as String,
    MediaMetadata.fromJson(json['mediaMetadata'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MediaItemToJson(MediaItem instance) => <String, dynamic>{
      'id': instance.id,
      'productUrl': instance.productUrl,
      'baseUrl': instance.baseUrl,
      'mimeType': instance.mimeType,
      'filename': instance.filename,
      'mediaMetadata': instance.mediaMetadata,
    };

MediaMetadata _$MediaMetadataFromJson(Map<String, dynamic> json) {
  return MediaMetadata(
    json['creationTime'] as String,
    json['width'] as String,
    json['height'] as String,
  );
}

Map<String, dynamic> _$MediaMetadataToJson(MediaMetadata instance) =>
    <String, dynamic>{
      'creationTime': instance.creationTime,
      'width': instance.width,
      'height': instance.height,
    };
