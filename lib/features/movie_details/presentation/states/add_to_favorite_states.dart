import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/action_response.dart';

part 'add_to_favorite_states.freezed.dart';

@freezed
class AddToFavoriteStates with _$AddToFavoriteStates {
  const factory AddToFavoriteStates.initial() = initial;

  const factory AddToFavoriteStates.loading() = loading;

  const factory AddToFavoriteStates.success(ActionResponse response) = success;

  const factory AddToFavoriteStates.error(String message) = error;
}
