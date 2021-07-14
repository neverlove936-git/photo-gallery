import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/models/album.dart';

part 'list_albums.g.dart';

@JsonSerializable()
class ListAlbums {
  ListAlbums(this.albums, this.nextPageToken);

  factory ListAlbums.fromJson(Map<String, dynamic> json) =>
      _$ListAlbumsFromJson(json);

  Map<String, dynamic> toJson() => _$ListAlbumsToJson(this);

  List<Album?>? albums;
  String? nextPageToken;
}
