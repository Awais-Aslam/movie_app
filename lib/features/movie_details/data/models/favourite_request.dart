class FavoriteRequest {
  final String mediaType;
  final int mediaId;
  final bool favorite;

  FavoriteRequest({
    required this.mediaType,
    required this.mediaId,
    required this.favorite,
  });

  Map<String, dynamic> toJson() {
    return {
      'media_type': mediaType,
      'media_id': mediaId,
      'favorite': favorite,
    };
  }
}
