import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/movie_repository.dart';
import '../states/favorite_movie_states.dart';

class FavoriteMovieCubit extends Cubit<FavoriteMovieStates> {
  FavoriteMovieCubit({required this.repository})
      : super(const FavoriteMovieStates.initial());

  final MovieRepository repository;

  // This method fetches favourite movies
  void fetchFavoriteMovies() async {
    emit(const FavoriteMovieStates.loading());
    try {
      final movies = await repository.getFavoriteMovies();
      emit(FavoriteMovieStates.favoriteMoviesLoaded(movies));
    } catch (e) {
      emit(FavoriteMovieStates.error(e.toString()));
    }
  }
}
