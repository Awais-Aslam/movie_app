import 'package:movie_app/features/movie_list/data/models/movie.dart';

import '../../../../core/network/exceptions.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Movie>> getFavoriteMovies() async {
    try {
      return await remoteDataSource.getFavoriteMovies();
    } on ServerException catch (e) {
      throw ServerException('Failed to load favorite movies: ${e.message}');
    }
  }

  @override
  Future<List<Movie>> getWatchlistMovies() async {
    try {
      return await remoteDataSource.getWatchlistMovies();
    } on ServerException catch (e) {
      throw ServerException('Failed to load favorite movies: ${e.message}');
    }
  }

  @override
  Future<List<Movie>> getTopRatedMovies({required int page}) async {
    try {
      return await remoteDataSource.getTopRatedMovies(page: page);
    } on ServerException catch (e) {
      throw ServerException('Failed to load favorite movies: ${e.message}');
    }
  }
}
