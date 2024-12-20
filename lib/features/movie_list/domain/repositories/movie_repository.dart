import '../../data/models/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getFavoriteMovies();
  Future<List<Movie>> getWatchlistMovies();
  Future<List<Movie>> getTopRatedMovies({required int page});
}