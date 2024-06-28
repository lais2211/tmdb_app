import 'package:dartz/dartz.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/cast_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';

import '../../../../core/errors/errors.dart';

abstract class MovieRepository {
  Future<Either<FailureSearch, List<MovieEntity>>> upcoming(
      {required int page});

  Future<Either<FailureSearch, List<MovieEntity>>> topRated(
      {required int page});

  Future<Either<FailureSearch, List<MovieEntity>>> nowPlaying(
      {required int page});

  Future<Either<FailureSearch, List<MovieEntity>>> popular(
      {required int page});

  Future<Either<FailureSearch, List<MovieEntity>>> searchMovie(
      {required String search, required int page});

  Future<Either<FailureSearch, List<CastEntity>>> cast({required int movieId});
}
