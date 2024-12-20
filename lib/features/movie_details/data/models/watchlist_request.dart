class WatchlistRequest {
  final String mediaType;
  final int mediaId;
  final bool watchlist;

  WatchlistRequest({
    required this.mediaType,
    required this.mediaId,
    required this.watchlist,
  });

  Map<String, dynamic> toJson() {
    return {
      'media_type': mediaType,
      'media_id': mediaId,
      'watchlist': watchlist,
    };
  }
}
