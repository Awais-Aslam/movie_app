import 'package:bloc/bloc.dart';

import '../../domain/repositories/movie_repository.dart';
import '../states/top_rated_movie_states.dart';

class TopRatedMovieCubit extends Cubit<TopRatedMovieStates> {
  final MovieRepository repository;

  TopRatedMovieCubit({required this.repository})
      : super(const TopRatedMovieStates.initial());

  // Fetch Top Rated Movies
  Future<void> fetchTopRatedMovies({required int page}) async {
    emit(const TopRatedMovieStates.loading());
    try {
      final topRatedMovies = await repository.getTopRatedMovies(page : page);
      emit(TopRatedMovieStates.topRatedMoviesLoaded(topRatedMovies));
    } catch (e) {
      emit(TopRatedMovieStates.error(e.toString()));
    }
  }
}
