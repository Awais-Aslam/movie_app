import 'package:movie_app/features/movie_details/data/models/action_response.dart';
import 'package:movie_app/features/movie_details/data/models/actor.dart';

import '../../data/models/favourite_request.dart';
import '../../data/models/watchlist_request.dart';


abstract class MovieDetailsRepository {
  Future<List<Actor>> getMovieCredits({required int movieId});
  Future<ActionResponse> addToFavourite({required FavoriteRequest favoriteRequest});
  Future<ActionResponse> addToWatchlist({required WatchlistRequest watchlistRequest});
}