import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_app/app/core/errors/errors.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/entities/cast_entity.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/repositories/movie_repository.dart';
import 'package:tmdb_app/app/modules/tmdb_app/domain/usecases/cast_usecase.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

class LoggerMock extends Mock implements Logger {}

void main() {
  final repository = MovieRepositoryMock();
  final logger = LoggerMock();
  final usecase = CastUsecaseImpl(repository: repository, logger: logger);
  const movieId = 1;

  test('should return a list of cast', () async {
    // Arrange
    final castEntityList = [
      CastEntity(name: '', profilePath: ''
        
      ),
    ];

    when(() => repository.cast(movieId: movieId))
        .thenAnswer((_) async => Right(castEntityList));

    // Act
    final result = await usecase(movieId: movieId);

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<CastEntity>>());
  });

  test('should return a FailureSearch on error', () async {
    // Arrange
    when(() => repository.cast(movieId: movieId))
        .thenAnswer((_) async => Left(InvalidResponseFailure()));

    // Act
    final result = await usecase(movieId: movieId);

    // Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, (_) => null), isA<FailureSearch>());
  });

}
