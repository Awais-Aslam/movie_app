import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/movie_list/data/models/movie.dart';

part 'favorite_movie_states.freezed.dart';

@freezed
class FavoriteMovieStates with _$FavoriteMovieStates {
  const factory FavoriteMovieStates.initial() = initial;

  const factory FavoriteMovieStates.loading() = loading;

  const factory FavoriteMovieStates.favoriteMoviesLoaded(List<Movie> movies) = favoriteMoviesLoaded;

  const factory FavoriteMovieStates.error(String message) = error;
}
