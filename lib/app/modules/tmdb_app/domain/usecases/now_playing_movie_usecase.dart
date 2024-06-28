import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/entities/movie_entity.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/repositories/movie_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class NowPLayingMovieUsecase {
  Future<Either<FailureSearch, List<MovieEntity>>> call(
      {required String language, required int page});
}

class NowPLayingMovieUsecaseImpl implements NowPLayingMovieUsecase {
  final MovieRepository repository;
  Logger logger;

  NowPLayingMovieUsecaseImpl({required this.repository, required this.logger});

  @override
  Future<Either<FailureSearch, List<MovieEntity>>> call(
      {required String language, required int page}) async {
    logger.d('Inicio do usecase na domain para now playing.');
    try {
      return await repository.nowPlaying(language: language, page: page);
    } on Exception {
      return Left(InvalidResponseFailure());
    }
  }
}
