// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewMediaItem _$NewMediaItemFromJson(Map<String, dynamic> json) {
  return NewMediaItem(
    json['description'] as String?,
    json['simpleMediaItem'] == null
        ? null
        : SimpleMediaItem.fromJson(
            json['simpleMediaItem'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewMediaItemToJson(NewMediaItem instance) =>
    <String, dynamic>{
      'description': instance.description,
      'simpleMediaItem': instance.simpleMediaItem,
    };

SimpleMediaItem _$SimpleMediaItemFromJson(Map<String, dynamic> json) {
  return SimpleMediaItem(
    json['uploadToken'] as String,
    json['fileName'] as String,
  );
}

Map<String, dynamic> _$SimpleMediaItemToJson(SimpleMediaItem instance) =>
    <String, dynamic>{
      'uploadToken': instance.uploadToken,
      'fileName': instance.fileName,
    };

BatchCreateMediaItemsRequest _$BatchCreateMediaItemsRequestFromJson(
    Map<String, dynamic> json) {
  return BatchCreateMediaItemsRequest(
    json['albumId'] as String,
    (json['newMediaItems'] as List<dynamic>)
        .map((e) => NewMediaItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BatchCreateMediaItemsRequestToJson(
        BatchCreateMediaItemsRequest instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'newMediaItems': instance.newMediaItems,
    };

BatchCreateMediaItemsResponse _$BatchCreateMediaItemsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchCreateMediaItemsResponse(
    (json['newMediaItemResults'] as List<dynamic>)
        .map((e) => NewMediaItemResult.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BatchCreateMediaItemsResponseToJson(
        BatchCreateMediaItemsResponse instance) =>
    <String, dynamic>{
      'newMediaItemResults': instance.newMediaItemResults,
    };

NewMediaItemResult _$NewMediaItemResultFromJson(Map<String, dynamic> json) {
  return NewMediaItemResult(
    json['uploadToken'] as String?,
    json['mediaItem'] == null
        ? null
        : MediaItem.fromJson(json['mediaItem'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewMediaItemResultToJson(NewMediaItemResult instance) =>
    <String, dynamic>{
      'uploadToken': instance.uploadToken,
      'mediaItem': instance.mediaItem,
    };
