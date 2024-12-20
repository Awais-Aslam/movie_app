import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/movie_list/data/models/movie.dart';

part 'watchlist_movie_states.freezed.dart';

@freezed
class WatchlistMovieStates with _$WatchlistMovieStates {
  const factory WatchlistMovieStates.initial() = initial;

  const factory WatchlistMovieStates.loading() = loading;

  const factory WatchlistMovieStates.watchlistMoviesLoaded(List<Movie> movies) = watchlistMoviesLoaded;

  const factory WatchlistMovieStates.error(String message) = error;
}
