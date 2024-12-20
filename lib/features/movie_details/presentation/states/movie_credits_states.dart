import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/movie_details/data/models/actor.dart';

part 'movie_credits_states.freezed.dart';

@freezed
class MovieCreditsStates with _$MovieCreditsStates {
  const factory MovieCreditsStates.initial() = initial;

  const factory MovieCreditsStates.loading() = loading;

  const factory MovieCreditsStates.movieCreditsLoaded(List<Actor> actors) = movieCreditsLoaded;

  const factory MovieCreditsStates.error(String message) = error;
}
