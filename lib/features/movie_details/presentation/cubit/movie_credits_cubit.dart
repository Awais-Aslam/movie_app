import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repository.dart';

import '../states/movie_credits_states.dart';

class MovieCreditsCubit extends Cubit<MovieCreditsStates> {
  MovieCreditsCubit({required this.movieDetailsRepository})
      : super(const MovieCreditsStates.initial());

  final MovieDetailsRepository movieDetailsRepository;

  // This method fetches movie credits
  Future<void> fetchMovieCredits({required int movieId}) async {
    emit(const MovieCreditsStates.loading());
    try {
      final movieCredits = await movieDetailsRepository.getMovieCredits(movieId: movieId);
      emit(MovieCreditsStates.movieCreditsLoaded(movieCredits));
    } catch (e) {
      emit(MovieCreditsStates.error(e.toString()));
    }
  }
}
