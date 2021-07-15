import 'package:json_annotation/json_annotation.dart';

import 'media_item.dart';

part 'new_media_item.g.dart';

@JsonSerializable()
class NewMediaItem {
  NewMediaItem(this.description, this.simpleMediaItem);

  NewMediaItem.simple(
      String uploadToken, String descriptionValue, String fileName) {
    description = descriptionValue;
    simpleMediaItem = SimpleMediaItem(uploadToken, fileName);
  }

  factory NewMediaItem.fromJson(Map<String, dynamic> json) =>
      _$NewMediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewMediaItemToJson(this);
  String? description;

  SimpleMediaItem? simpleMediaItem;
}

@JsonSerializable()
class SimpleMediaItem {
  SimpleMediaItem(this.uploadToken, this.fileName);

  factory SimpleMediaItem.fromJson(Map<String, dynamic> json) =>
      _$SimpleMediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleMediaItemToJson(this);

  String uploadToken;
  String fileName;
}

@JsonSerializable()
class BatchCreateMediaItemsRequest {
  BatchCreateMediaItemsRequest(
    this.albumId,
    this.newMediaItems,
  );

  static BatchCreateMediaItemsRequest inAlbum(
      String uploadToken, String albumId, String description, String fileName) {
    return BatchCreateMediaItemsRequest(
      albumId,
      <NewMediaItem>[NewMediaItem.simple(uploadToken, description, fileName)],
    );
  }

  factory BatchCreateMediaItemsRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateMediaItemsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BatchCreateMediaItemsRequestToJson(this);
  String albumId;
  List<NewMediaItem> newMediaItems;
}

@JsonSerializable()
class BatchCreateMediaItemsResponse {
  BatchCreateMediaItemsResponse(this.newMediaItemResults);

  factory BatchCreateMediaItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateMediaItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BatchCreateMediaItemsResponseToJson(this);

  List<NewMediaItemResult> newMediaItemResults;
}

@JsonSerializable()
class NewMediaItemResult {
  NewMediaItemResult(this.uploadToken, this.mediaItem);

  factory NewMediaItemResult.fromJson(Map<String, dynamic> json) =>
      _$NewMediaItemResultFromJson(json);

  Map<String, dynamic> toJson() => _$NewMediaItemResultToJson(this);

  String? uploadToken;
  MediaItem? mediaItem;
}
