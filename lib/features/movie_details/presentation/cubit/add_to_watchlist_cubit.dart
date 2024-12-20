import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repository.dart';

import '../../data/models/watchlist_request.dart';
import '../states/add_to_watchlist_states.dart';

class AddToWatchlistCubit extends Cubit<AddToWatchlistStates> {
  AddToWatchlistCubit({required this.movieDetailsRepository})
      : super(const AddToWatchlistStates.initial());

  final MovieDetailsRepository movieDetailsRepository;

  // This method adds movie to watchlist
  Future<void> addToWatchlist({
    required int mediaId,
    required bool watchlist,
  }) async {
    emit(const AddToWatchlistStates.loading());
    try {
      final watchlistRequest = WatchlistRequest(
          mediaType: 'movie', mediaId: mediaId, watchlist: watchlist);
      final response = await movieDetailsRepository.addToWatchlist(
        watchlistRequest: watchlistRequest,
      );
      emit(AddToWatchlistStates.success(response));
    } catch (e) {
      emit(AddToWatchlistStates.error(e.toString()));
    }
  }
}
