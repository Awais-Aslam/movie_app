import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/add_to_favorite_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/add_to_watchlist_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_credits_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/screens/movie_details_screen.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/favourite_movie_cubit.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/top_rated_movie_cubit.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/watchlist_movie_cubit.dart';
import 'package:movie_app/features/movie_list/presentation/screens/movie_list_screen.dart';
import 'core/constants/strings.dart';
import 'core/di/injector.dart';
import 'core/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteMovieCubit>(
          lazy: true,
          create: (_) => Injector.resolve(),
        ),
        BlocProvider<WatchlistMovieCubit>(
          lazy: true,
          create: (_) => Injector.resolve(),
        ),
        BlocProvider<TopRatedMovieCubit>(
          lazy: true,
          create: (_) => Injector.resolve(),
        ),
        BlocProvider<MovieCreditsCubit>(
          lazy: true,
          create: (_) => Injector.resolve(),
        ),
        BlocProvider<AddToFavouriteCubit>(
          lazy: true,
          create: (_) => Injector.resolve(),
        ),
        BlocProvider<AddToWatchlistCubit>(
          lazy: true,
          create: (_) => Injector.resolve(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: Routes.movieListScreen,
      ),
    );
  }
}
