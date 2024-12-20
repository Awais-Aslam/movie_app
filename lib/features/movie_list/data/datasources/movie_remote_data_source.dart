import '../../../../core/network/exceptions.dart';
import '../../../../core/network/network_service.dart';
import '../models/movie.dart';

abstract class MovieRemoteDataSource {
  Future<List<Movie>> getFavoriteMovies();

  Future<List<Movie>> getWatchlistMovies();

  Future<List<Movie>> getTopRatedMovies({required int page});
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final NetworkService _networkService;

  MovieRemoteDataSourceImpl(this._networkService);

  @override
  Future<List<Movie>> getFavoriteMovies() async {
    try {
      final response = await _networkService.get(
        'account/21695066/favorite/movies?language=en-US&page=1&sort_by=created_at.asc',
      );
      return _parseMovies(response.data);
    } catch (e) {
      throw ServerException('Failed to load favorite movies');
    }
  }

  @override
  Future<List<Movie>> getWatchlistMovies() async {
    try {
      final response = await _networkService.get(
        'account/21695066/watchlist/movies?language=en-US&page=1&sort_by=created_at.asc',
      );
      return _parseMovies(response.data);
    } catch (e) {
      throw ServerException('Failed to load favorite movies');
    }
  }

  @override
  Future<List<Movie>> getTopRatedMovies({required int page}) async {
    try {
      final response = await _networkService.get(
        'movie/top_rated?language=en-US&page=$page',
      );
      return _parseMovies(response.data);
    } catch (e) {
      throw ServerException('Failed to load favorite movies');
    }
  }

  List<Movie> _parseMovies(Map<String, dynamic> data) {
    return (data['results'] as List)
        .map((movieData) => Movie.fromJson(movieData))
        .toList();
  }
}
