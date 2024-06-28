import 'package:dartz/dartz.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/entities/cast_entity.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/entities/movie_entity.dart';

import '../../../../core/errors/errors.dart';

abstract class MovieRepository {
  Future<Either<FailureSearch, List<MovieEntity>>> upcoming(
      {required String language, required int page});

  Future<Either<FailureSearch, List<MovieEntity>>> topRated(
      {required String language, required int page});

  Future<Either<FailureSearch, List<MovieEntity>>> nowPlaying(
      {required String language, required int page});

  Future<Either<FailureSearch, List<MovieEntity>>> popular(
      {required String language, required int page});

  Future<Either<FailureSearch, List<MovieEntity>>> searchMovie(
      {required String language, required String search, required int page});

  Future<Either<FailureSearch, List<CastEntity>>> cast({required int movieId});
}
