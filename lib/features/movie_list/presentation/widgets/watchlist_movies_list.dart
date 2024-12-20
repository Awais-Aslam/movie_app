import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/watchlist_movie_cubit.dart';
import 'package:movie_app/features/movie_list/presentation/states/watchlist_movie_states.dart';
import '../../../../core/constants/strings.dart';
import '../widgets/compact_movie_card.dart';

class WatchlistMoviesList extends StatelessWidget {
  const WatchlistMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistMovieCubit, WatchlistMovieStates>(
      builder: (context, state) {
        return state.maybeMap(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          watchlistMoviesLoaded: (watchlist) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.42,
            child: watchlist.movies.isEmpty
                ? const Center(child: Text(Strings.noWatchlistMoviesAvailable))
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: watchlist.movies.length,
                    itemBuilder: (context, index) {
                      final movie = watchlist.movies[index];
                      return CompactMovieCard(
                        movie: movie,
                        favourite: false,
                        watchlist: true,
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
