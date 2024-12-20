import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/action_response.dart';

part 'add_to_watchlist_states.freezed.dart';

@freezed
class AddToWatchlistStates with _$AddToWatchlistStates {
  const factory AddToWatchlistStates.initial() = initial;

  const factory AddToWatchlistStates.loading() = loading;

  const factory AddToWatchlistStates.success(ActionResponse response) = success;

  const factory AddToWatchlistStates.error(String message) = error;
}
