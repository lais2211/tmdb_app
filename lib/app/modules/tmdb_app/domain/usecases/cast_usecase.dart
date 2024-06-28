import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/entities/cast_entity.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/repositories/movie_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class CastUsecase {
  Future<Either<FailureSearch, List<CastEntity>>> call({required int movieId});
}

class CastUsecaseImpl implements CastUsecase {
  final MovieRepository repository;
  Logger logger;

  CastUsecaseImpl({required this.repository, required this.logger});

  @override
  Future<Either<FailureSearch, List<CastEntity>>> call(
      {required int movieId}) async {
    logger.d('Inicio do usecase na domain para cast.');
    try {
      return await repository.cast(movieId: movieId);
    } on Exception {
      return Left(InvalidResponseFailure());
    }
  }
}
