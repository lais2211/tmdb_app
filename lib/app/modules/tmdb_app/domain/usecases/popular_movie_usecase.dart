import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/entities/movie_entity.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/repositories/movie_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class PopularMovieUsecase {
  Future<Either<FailureSearch, List<MovieEntity>>> call(
      {required String language,  required int page});
}

class PopularMovieUsecaseImpl implements PopularMovieUsecase {
  final MovieRepository repository;
  Logger logger;

  PopularMovieUsecaseImpl({required this.repository, required this.logger});

  @override
  Future<Either<FailureSearch, List<MovieEntity>>> call(
      {required String language,  required int page}) async {
    logger.d('Inicio do usecase na domain para popular.');
    try {
      return await repository.popular(language: language, page: page);
    } on Exception {
      return Left(InvalidResponseFailure());
    }
  }
}