import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_app/features/movie_details/data/datasources/movie_details_remote_data_source.dart';
import 'package:movie_app/features/movie_details/data/repositories/movie_details_repository_impl.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/add_to_favorite_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_credits_cubit.dart';
import 'package:movie_app/features/movie_list/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/favourite_movie_cubit.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/top_rated_movie_cubit.dart';
import 'package:movie_app/features/movie_list/presentation/cubit/watchlist_movie_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/movie_details/presentation/cubit/add_to_watchlist_cubit.dart';
import '../../features/movie_list/data/datasources/movie_remote_data_source.dart';
import '../network/network_service.dart';

abstract class Injector {
  static late final KiwiContainer _container;
  static final resolve = _container.resolve;

  static Future<void> setup() async {
    _container = KiwiContainer();
    _setupDio();
    _setupNetworkService();
    _setupMovieRemoteDataSource();
    _setupMovieDetailsRemoteDataSource();
    _setupMovieRepository();
    _setupMovieDetailsRepository();
    _registerFavouriteMovieCubit();
    _registerWatchlistMovieCubit();
    _registerTopRatedMovieCubit();
    _registerMovieCreditsCubit();
    _registerAddToFavouriteCubit();
    _registerAddToWatchlistCubit();
  }

  static void _setupDio() {
    final dio = Dio();

    // Add the PrettyDioLogger interceptor
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    // Register the Dio instance in the container
    _container.registerSingleton<Dio>((_) => dio);
  }

  static void _setupNetworkService() {
    _container.registerSingleton<NetworkService>(
      (_) => NetworkService(
        _container.resolve(),
      ),
    );
  }

  static void _setupMovieRemoteDataSource() {
    _container.registerSingleton<MovieRemoteDataSource>(
      (_) => MovieRemoteDataSourceImpl(
        _container.resolve(),
      ),
    );
  }

  static void _setupMovieDetailsRemoteDataSource() {
    _container.registerSingleton<MovieDetailsRemoteDataSource>(
      (_) => MovieDetailsRemoteDataSourceImpl(
        _container.resolve(),
      ),
    );
  }

  static void _setupMovieRepository() {
    _container.registerSingleton<MovieRepository>(
      (_) => MovieRepositoryImpl(
        _container.resolve(),
      ),
    );
  }

  static void _setupMovieDetailsRepository() {
    _container.registerSingleton<MovieDetailsRepository>(
      (_) => MovieDetailsRepositoryImpl(
        _container.resolve(),
      ),
    );
  }

  static void _registerFavouriteMovieCubit() {
    _container.registerSingleton(
      (_) => FavoriteMovieCubit(
        repository: _container.resolve(),
      ),
    );
  }

  static void _registerWatchlistMovieCubit() {
    _container.registerSingleton(
      (_) => WatchlistMovieCubit(
        repository: _container.resolve(),
      ),
    );
  }

  static void _registerTopRatedMovieCubit() {
    _container.registerSingleton(
      (_) => TopRatedMovieCubit(
        repository: _container.resolve(),
      ),
    );
  }

  static void _registerMovieCreditsCubit() {
    _container.registerSingleton(
      (_) => MovieCreditsCubit(
        movieDetailsRepository: _container.resolve(),
      ),
    );
  }

  static void _registerAddToFavouriteCubit() {
    _container.registerSingleton(
      (_) => AddToFavouriteCubit(
        movieDetailsRepository: _container.resolve(),
      ),
    );
  }

  static void _registerAddToWatchlistCubit() {
    _container.registerSingleton(
      (_) => AddToWatchlistCubit(
        movieDetailsRepository: _container.resolve(),
      ),
    );
  }

  @visibleForTesting
  static Future<void> setupTest({required KiwiContainer container}) async {
    _container = container;
  }

  static void clear() {
    _container.clear();
  }
}
