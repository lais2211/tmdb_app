import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/app/core/errors/errors.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/cast_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';

import '../../domain/repositories/movie_repository.dart';
import '../datasource/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource datasource;
  Logger logger;

  MovieRepositoryImpl({required this.datasource, required this.logger});

  @override
  Future<Either<FailureSearch, List<CastEntity>>> cast(
      {required int movieId}) async {
    logger.d('Inicio do repository na infra getCast.');
    try {
      final result = await datasource.getCast(
        movieId: movieId,
      );
      return Right(result);
    } on Exception {
      return Left(DataSourceFailure());
    }
  }

  @override
  Future<Either<FailureSearch, List<MovieEntity>>> nowPlaying(
      {required String language,  required int page}) async {
    logger.d('Inicio do repository na infra getNowPlayingMovies.');
    try {
      final result = await datasource.getNowPlayingMovies(
        language: language,
        page: page,
      );
      return Right(result);
    } on Exception {
      return Left(DataSourceFailure());
    }
  }

  @override
  Future<Either<FailureSearch, List<MovieEntity>>> popular(
      {required String language,  required int page}) async {
    logger.d('Inicio do repository na infra getPopularMovies.');
    try {
      final result = await datasource.getPopularMovies(
        language: language,
        page: page,
      );
      return Right(result);
    } on Exception {
      return Left(DataSourceFailure());
    }
  }

  @override
  Future<Either<FailureSearch, List<MovieEntity>>> searchMovie(
      {required String language, required String search,  required int page}) async {
    logger.d('Inicio do repository na infra searchMovies.');
    try {
      final result = await datasource.searchMovies(
        language: language,
        search: search,
        page: page
      );
      return Right(result);
    } on Exception {
      return Left(DataSourceFailure());
    }
  }

  @override
  Future<Either<FailureSearch, List<MovieEntity>>> topRated(
      {required String language,  required int page}) async {
    logger.d('Inicio do repository na infra getTopRatedMovies.');
    try {
      final result = await datasource.getTopRatedMovies(
        language: language,
        page: page,
      );
      return Right(result);
    } on Exception {
      return Left(DataSourceFailure());
    }
  }

  @override
  Future<Either<FailureSearch, List<MovieEntity>>> upcoming(
      {required String language, required int page}) async {
    logger.d('Inicio do repository na infra getUpcomingMovies.');
    try {
      final result = await datasource.getUpcomingMovies(
        language: language,
        page: page
      );
      return Right(result);
    } on Exception {
      return Left(DataSourceFailure());
    }
  }
}
