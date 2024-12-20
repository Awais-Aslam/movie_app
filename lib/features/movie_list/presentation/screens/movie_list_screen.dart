import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/favourite_movie_cubit.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/top_rated_movie_cubit.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/watchlist_movie_cubit.dart';
import 'package:movie_app/features/movie_list/presentation/states/top_rated_movie_states.dart';
import 'package:movie_app/features/movie_list/presentation/widgets/favourite_movies_list.dart';
import 'package:movie_app/features/movie_list/presentation/widgets/watchlist_movies_list.dart';
import '../../../../core/constants/strings.dart';
import '../widgets/detailed_movie_card.dart';
import '../widgets/movie_section.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TopRatedMovieCubit>().fetchTopRatedMovies(page: currentPage);
      context.read<FavoriteMovieCubit>().fetchFavoriteMovies();
      context.read<WatchlistMovieCubit>().fetchWatchlistMovies();
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isLoading) {
      // Trigger pagination
      setState(() {
        isLoading = true;
      });
      currentPage++;
      context.read<TopRatedMovieCubit>().fetchTopRatedMovies(page: currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.movies),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Favourite Movies list
              MovieSection(
                title: Strings.favouriteMovies,
                builder: (context, state) => const FavouriteMoviesList(),
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  Strings.topRatedMovies,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // First 10 top rated movies
              BlocBuilder<TopRatedMovieCubit, TopRatedMovieStates>(
                builder: (context, state) {
                  return state.maybeMap(
                    loading: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    topRatedMoviesLoaded: (topRatedMoviesList) {
                      final first10Movies =
                          topRatedMoviesList.movies.take(10).toList();
                      isLoading = false;
                      return ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: first10Movies.length,
                        itemBuilder: (context, index) {
                          final movie = first10Movies[index];
                          return DetailedMovieCard(movie: movie);
                        },
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Watchlist Movies list
              MovieSection(
                title: Strings.watchlistMovies,
                builder: (context, state) => const WatchlistMoviesList( ),
              ),

              const SizedBox(height: 20),

              // Remaining Top Rated Movies
              BlocBuilder<TopRatedMovieCubit, TopRatedMovieStates>(
                builder: (context, state) {
                  return state.maybeMap(
                    topRatedMoviesLoaded: (topRatedMoviesList) {
                      final remainingMovies =
                          topRatedMoviesList.movies.skip(10).toList();
                      return ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: remainingMovies.length,
                        itemBuilder: (context, index) {
                          final movie = remainingMovies[index];
                          return DetailedMovieCard(movie: movie);
                        },
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
