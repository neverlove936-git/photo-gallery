import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/models/media_item.dart';

part 'list_media_item.g.dart';

@JsonSerializable()
class ListMediaItems {
  ListMediaItems(this.mediaItems, this.nextPageToken);

  factory ListMediaItems.fromJson(Map<String, dynamic> json) =>
      _$ListMediaItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ListMediaItemsToJson(this);

  List<MediaItem>? mediaItems;
  String? nextPageToken;
}
