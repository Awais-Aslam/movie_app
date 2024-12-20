import 'package:bloc/bloc.dart';

import '../../domain/repositories/movie_repository.dart';
import '../states/watchlist_movie_states.dart';

class WatchlistMovieCubit extends Cubit<WatchlistMovieStates> {
  final MovieRepository repository;

  WatchlistMovieCubit({required this.repository})
      : super(const WatchlistMovieStates.initial());

  // Fetch Watchlist Movies
  Future<void> fetchWatchlistMovies() async {
    emit(const WatchlistMovieStates.loading());
    try {
      final watchlistMovies = await repository.getWatchlistMovies();
      emit(WatchlistMovieStates.watchlistMoviesLoaded(watchlistMovies));
    } catch (e) {
      emit(WatchlistMovieStates.error(e.toString()));
    }
  }
}
