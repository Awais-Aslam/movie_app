import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WatchlistRequest {
  final String mediaType;
  final int mediaId;
  final bool watchlist;

  WatchlistRequest({
    required this.mediaType,
    required this.mediaId,
    required this.watchlist,
  });

  Map<String, dynamic> toJson() => _$WatchlistRequestToJson(this);
}
