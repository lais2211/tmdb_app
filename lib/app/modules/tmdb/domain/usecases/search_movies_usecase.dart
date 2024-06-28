import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/repositories/movie_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class SearchMoviesUsecase {
  Future<Either<FailureSearch, List<MovieEntity>>> call(
      {required String search,  required int page});
}

class SearchMoviesUsecaseImpl implements SearchMoviesUsecase {
  final MovieRepository repository;
  Logger logger;

  SearchMoviesUsecaseImpl({required this.repository, required this.logger});

  @override
  Future<Either<FailureSearch, List<MovieEntity>>> call(
      {required String search,  required int page}) async {
    logger.d('Inicio do usecase na domain para SearchMovies.');
    try {
      return await repository.searchMovie( search: search, page: page);
    } on Exception {
      return Left(InvalidResponseFailure());
    }
  }
}
