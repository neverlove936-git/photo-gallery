// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_albums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAlbums _$ListAlbumsFromJson(Map<String, dynamic> json) {
  return ListAlbums(
    (json['albums'] as List<dynamic>)
        .map(
            (e) => e == null ? null : Album.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['nextPageToken'] == null ? null : json['nextPageToken'] as String,
  );
}

Map<String, dynamic> _$ListAlbumsToJson(ListAlbums instance) =>
    <String, dynamic>{
      'albums': instance.albums,
      'nextPageToken': instance.nextPageToken,
    };
