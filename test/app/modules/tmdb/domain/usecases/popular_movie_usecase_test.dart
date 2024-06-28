import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_app/app/core/errors/errors.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/repositories/movie_repository.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/usecases/popular_movie_usecase.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

class LoggerMock extends Mock implements Logger {}

void main() {
  final repository = MovieRepositoryMock();
  final logger = LoggerMock();
  final usecase =
      PopularMovieUsecaseImpl(repository: repository, logger: logger);
  const language = 'pt-BR';
  const page = 1;

  test('should return a list of movies', () async {
    // Arrange
    final moviesEntityList = [
      MovieEntity(
        id: 1,
        title: 'Test Character',
        posterPath: 'test.com',
        overview: '',
        releaseDate: '',
        voteAverage: 2,
        voteCount: 3,
      ),
    ];

    when(() => repository.popular(language: language, page: page))
        .thenAnswer((_) async => Right(moviesEntityList));

    // Act
    final result = await usecase(language: language, page: page);

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<MovieEntity>>());
  });

  test('should return a FailureSearch on error', () async {
    // Arrange
    when(() => repository.popular(language: language, page: page))
        .thenAnswer((_) async => Left(InvalidResponseFailure()));

    // Act
    final result = await usecase(language: language, page: page);

    // Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, (_) => null), isA<FailureSearch>());
  });
}
