import 'package:movie_app/features/movie_details/data/datasources/movie_details_remote_data_source.dart';
import 'package:movie_app/features/movie_details/data/models/action_response.dart';
import 'package:movie_app/features/movie_details/data/models/actor.dart';
import 'package:movie_app/features/movie_details/data/models/favorite_request.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repository.dart';

import '../../../../core/network/exceptions.dart';
import '../models/watchlist_request.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;

  MovieDetailsRepositoryImpl(this.movieDetailsRemoteDataSource);

  @override
  Future<List<Actor>> getMovieCredits({required int movieId}) async {
    try {
      return await movieDetailsRemoteDataSource.getMovieCredits(
        movieId: movieId,
      );
    } on ServerException catch (e) {
      throw ServerException('Failed to load movie credits : ${e.message}');
    }
  }

  @override
  Future<ActionResponse> addToFavourite({required FavoriteRequest favoriteRequest}) async {
    try {
      return await movieDetailsRemoteDataSource.addToFavourite(
        favoriteRequest: favoriteRequest,
      );
    } on ServerException catch (e) {
      throw ServerException('Failed to add to favourites : ${e.message}');
    }
  }

  @override
  Future<ActionResponse> addToWatchlist({required WatchlistRequest watchlistRequest}) async {
    try {
      return await movieDetailsRemoteDataSource.addToWatchlist(
        watchlistRequest: watchlistRequest,
      );
    } on ServerException catch (e) {
      throw ServerException('Failed to add to favourites : ${e.message}');
    }
  }
}
