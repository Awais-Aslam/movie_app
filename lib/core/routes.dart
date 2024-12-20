import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_details/presentation/screens/movie_details_screen.dart';

import '../features/movie_list/presentation/screens/movie_list_screen.dart';

class Routes {
  static const String movieListScreen = '/';
  static const String movieDetailScreen = '/movieDetail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case movieListScreen:
        return MaterialPageRoute(
          builder: (context) => const MovieListScreen(),
        );
      case movieDetailScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final title = args['title'];
        final rating = args['rating'];
        final overview = args['overview'];
        final favourite = args['favourite'];
        final watchlist = args['watchlist'];
        final mediaId = args['mediaId'];
        return MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(
            title: title,
            rating: rating,
            overview: overview,
            favourite: favourite,
            watchlist: watchlist,
            mediaId: mediaId,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const MovieListScreen(),
        );
    }
  }
}
