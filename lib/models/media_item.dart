import 'package:json_annotation/json_annotation.dart';

part 'media_item.g.dart';

@JsonSerializable()
class MediaItem {
  MediaItem(
    this.id,
    this.productUrl,
    this.baseUrl,
    this.mimeType,
    this.filename,
    this.mediaMetadata,
  );

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$MediaItemToJson(this);

  String id;
  String productUrl;
  String baseUrl;
  String mimeType;
  String filename;
  MediaMetadata mediaMetadata;
}

@JsonSerializable()
class MediaMetadata {
  MediaMetadata(
    this.creationTime,
    this.width,
    this.height,
  );

  factory MediaMetadata.fromJson(Map<String, dynamic> json) =>
      _$MediaMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MediaMetadataToJson(this);

  String creationTime;
  String width;
  String height;
}
