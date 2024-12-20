import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/movie_list/data/models/movie.dart';

part 'top_rated_movie_states.freezed.dart';

@freezed
class TopRatedMovieStates with _$TopRatedMovieStates {
  const factory TopRatedMovieStates.initial() = initial;

  const factory TopRatedMovieStates.loading() = loading;

  const factory TopRatedMovieStates.topRatedMoviesLoaded(List<Movie> movies) = topRatedMoviesLoaded;

  const factory TopRatedMovieStates.error(String message) = error;
}
