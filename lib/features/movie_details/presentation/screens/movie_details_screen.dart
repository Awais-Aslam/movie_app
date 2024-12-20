import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../movie_list/presentation/cubit/favourite_movie_cubit.dart';
import '../../../movie_list/presentation/cubit/watchlist_movie_cubit.dart';
import '../widgets/buttons_section.dart';
import '../widgets/cast_section.dart';
import '../widgets/overview_widget.dart';
import '../widgets/rating_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final double rating;
  final String overview;
  final String title;
  final bool favourite;
  final bool watchlist;
  final int mediaId;

  const MovieDetailsScreen({
    super.key,
    required this.title,
    required this.rating,
    required this.overview,
    required this.favourite,
    required this.watchlist,
    required this.mediaId,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool pop) {
        // To get the updated list for favorites and watchlist
        context.read<FavoriteMovieCubit>().fetchFavoriteMovies();
        context.read<WatchlistMovieCubit>().fetchWatchlistMovies();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingWidget(rating: rating),
              const SizedBox(height: 24),
              OverviewWidget(overview: overview),
              const SizedBox(height: 24),
              const CastSection(),
              const SizedBox(height: 24),
              ButtonsSection(
                mediaId: mediaId,
                favourite: favourite,
                watchlist: watchlist,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
