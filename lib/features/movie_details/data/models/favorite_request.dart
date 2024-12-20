import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FavoriteRequest {
  final String mediaType;
  final int mediaId;
  final bool favorite;

  FavoriteRequest({
    required this.mediaType,
    required this.mediaId,
    required this.favorite,
  });

  Map<String, dynamic> toJson() => _$FavoriteRequestToJson(this);
}
