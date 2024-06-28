import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/repositories/movie_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class UpcomingMovieUsecase {
  Future<Either<FailureSearch, List<MovieEntity>>> call(
      {required String language,  required int page});
}

class UpcomingMovieUsecaseImpl implements UpcomingMovieUsecase {
  final MovieRepository repository;
  Logger logger;

  UpcomingMovieUsecaseImpl({required this.repository, required this.logger});

  @override
  Future<Either<FailureSearch, List<MovieEntity>>> call(
      {required String language,  required int page}) async {
    logger.d('Inicio do usecase na domain para upcoming.');
    try {
      return await repository.upcoming(language: language, page: page);
    } on Exception {
      return Left(InvalidResponseFailure());
    }
  }
}
