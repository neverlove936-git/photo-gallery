// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMediaItems _$ListMediaItemsFromJson(Map<String, dynamic> json) {
  return ListMediaItems(
    (json['mediaItems'] as List<dynamic>?)
        ?.map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['nextPageToken'] as String?,
  );
}

Map<String, dynamic> _$ListMediaItemsToJson(ListMediaItems instance) =>
    <String, dynamic>{
      'mediaItems': instance.mediaItems,
      'nextPageToken': instance.nextPageToken,
    };
