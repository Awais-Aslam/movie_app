import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/favourite_movie_cubit.dart';
import 'package:movie_app/features/movie_list/presentation/states/favorite_movie_states.dart';
import '../../../../core/constants/strings.dart';
import '../widgets/compact_movie_card.dart';

class FavouriteMoviesList extends StatelessWidget {
  const FavouriteMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteMovieCubit, FavoriteMovieStates>(
      builder: (context, state) {
        return state.maybeMap(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          favoriteMoviesLoaded: (favouriteList) => favouriteList.movies.isEmpty
              ? const Center(child: Text(Strings.noFavouriteMoviesAvailable))
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: favouriteList.movies.length,
                    itemBuilder: (context, index) {
                      final movie = favouriteList.movies[index];
                      return CompactMovieCard(
                        movie: movie,
                        favourite: true,
                        watchlist: false,
                      );
                    },
                  ),
                ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
