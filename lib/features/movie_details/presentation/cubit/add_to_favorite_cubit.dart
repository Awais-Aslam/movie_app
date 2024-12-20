import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repository.dart';

import '../../data/models/favorite_request.dart';
import '../states/add_to_favorite_states.dart';

class AddToFavouriteCubit extends Cubit<AddToFavoriteStates> {
  AddToFavouriteCubit({required this.movieDetailsRepository})
      : super(const AddToFavoriteStates.initial());

  final MovieDetailsRepository movieDetailsRepository;

  // This method adds movie to favourites
  Future<void> addToFavorite({
    required int mediaId,
    required bool favorite,
  }) async {
    emit(const AddToFavoriteStates.loading());
    try {
      final favoriteRequest = FavoriteRequest(
          mediaType: 'movie', mediaId: mediaId, favorite: favorite);
      final response = await movieDetailsRepository.addToFavourite(
        favoriteRequest: favoriteRequest,
      );
      emit(AddToFavoriteStates.success(response));
    } catch (e) {
      emit(AddToFavoriteStates.error(e.toString()));
    }
  }
}
