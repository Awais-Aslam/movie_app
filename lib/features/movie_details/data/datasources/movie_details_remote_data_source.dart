import 'package:movie_app/features/movie_details/data/models/action_response.dart';
import 'package:movie_app/features/movie_details/data/models/actor.dart';
import 'package:movie_app/features/movie_details/data/models/watchlist_request.dart';

import '../../../../core/network/exceptions.dart';
import '../../../../core/network/network_service.dart';
import '../models/favourite_request.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<List<Actor>> getMovieCredits({required int movieId});

  Future<ActionResponse> addToFavourite({
    required FavoriteRequest favoriteRequest,
  });

  Future<ActionResponse> addToWatchlist({
    required WatchlistRequest watchlistRequest,
  });
}

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final NetworkService _networkService;

  MovieDetailsRemoteDataSourceImpl(this._networkService);

  @override
  Future<List<Actor>> getMovieCredits({required int movieId}) async {
    try {
      final response = await _networkService.get(
        'movie/$movieId/credits?language=en-US',
      );
      return _parseActorsList(response.data);
    } catch (e) {
      throw ServerException('Failed to load favorite movies');
    }
  }

  @override
  Future<ActionResponse> addToFavourite(
      {required FavoriteRequest favoriteRequest}) async {
    try {
      final response = await _networkService.post(
        'account/21695066/favorite',
        favoriteRequest.toJson(),
      );
      if (response.statusCode == 200) {
        return ActionResponse.fromJson(response.data);
      } else {
        throw ServerException(
            'Failed to add to favorites: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException('Failed to add to favorites');
    }
  }

  @override
  Future<ActionResponse> addToWatchlist(
      {required WatchlistRequest watchlistRequest}) async {
    try {
      final response = await _networkService.post(
        'account/21695066/watchlist',
        watchlistRequest.toJson(),
      );
      if (response.statusCode == 200) {
        return ActionResponse.fromJson(response.data);
      } else {
        throw ServerException(
            'Failed to add to watchlist: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException('Failed to add to watchlist');
    }
  }

  List<Actor> _parseActorsList(Map<String, dynamic> data) {
    return (data['cast'] as List)
        .map((actor) => Actor.fromJson(actor))
        .toList();
  }
}
