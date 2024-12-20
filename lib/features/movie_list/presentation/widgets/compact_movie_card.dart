import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_credits_cubit.dart';

import '../../data/models/movie.dart';

class CompactMovieCard extends StatelessWidget {
  final Movie movie;
  final bool favourite;
  final bool watchlist;

  const CompactMovieCard({
    super.key,
    required this.movie,
    required this.favourite,
    required this.watchlist,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MovieCreditsCubit>().fetchMovieCredits(movieId: movie.id);
        Navigator.pushNamed(
          context,
          '/movieDetail',
          arguments: {
            'title': movie.title,
            'rating': movie.voteAverage,
            'overview': movie.overview,
            'favourite': favourite,
            'watchlist': watchlist,
            'mediaId': movie.id,
          },
        );
      },
      child: Container(
        width: 160, // Fixed width for consistency
        margin: const EdgeInsets.only(right: 12), // Space between cards
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Adapts height to content
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                width: 160,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    movie.releaseDate,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
