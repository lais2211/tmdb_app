import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_app/app/core/errors/errors.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/cast_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/infra/datasource/movie_datasource.dart';
import 'package:tmdb_app/app/modules/tmdb/infra/models/cast_model.dart';
import 'package:tmdb_app/app/modules/tmdb/infra/models/movie_model.dart';
import 'package:tmdb_app/app/modules/tmdb/infra/repositories/movie_repository_impl.dart';

class MovieDataSourceMock extends Mock implements MovieDatasource {}

class LoggerMock extends Mock implements Logger {}

void main() {
  final datasource = MovieDataSourceMock();
  final logger = LoggerMock();
  const language = 'pt-BR';
  const search = 'test';
  const movieId = 1;
  const page = 1;
  final repository =
      MovieRepositoryImpl(datasource: datasource, logger: logger);

  test('should return a list of upcoming movies', () async {
    // Arrange
    final movieModel = [
      MovieModel(
        id: 1,
        title: 'Test Character',
        posterPath: 'test.com',
        overview: '',
        releaseDate: '',
        voteAverage: 2,
        voteCount: 3,
      ),
    ];

    when(() => datasource.getUpcomingMovies(language: language, page: page))
        .thenAnswer((_) async => movieModel);

    // Act
    final result = await repository.upcoming(language: language, page: page);

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<MovieEntity>>());
  });

  test(
      'should return a DataSourceFailure when getUpcomingMovies throws an Exception',
      () async {
    // Arrange
    when(() => datasource.getUpcomingMovies(language: language, page: page))
        .thenThrow(Exception());

    // Act
    final result = await repository.upcoming(language: language, page: page);

    // Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<DataSourceFailure>());
  });
  test('should return a list of NowPlaying movies', () async {
    // Arrange
    final movieModel = [
      MovieModel(
        id: 1,
        title: 'Test Character',
        posterPath: 'test.com',
        overview: '',
        releaseDate: '',
        voteAverage: 2,
        voteCount: 3,
      ),
    ];

    when(() => datasource.getNowPlayingMovies(language: language, page: page))
        .thenAnswer((_) async => movieModel);

    // Act
    final result = await repository.nowPlaying(language: language, page: page);

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<MovieEntity>>());
  });

  test(
      'should return a DataSourceFailure when getNowPlayingMovies throws an Exception',
      () async {
    // Arrange
    when(() => datasource.getNowPlayingMovies(language: language, page: page))
        .thenThrow(Exception());

    // Act
    final result = await repository.nowPlaying(language: language, page: page);

    // Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<DataSourceFailure>());
  });

  test('should return a list of Popular movies', () async {
    // Arrange
    final movieModel = [
      MovieModel(
        id: 1,
        title: 'Test Character',
        posterPath: 'test.com',
        overview: '',
        releaseDate: '',
        voteAverage: 2,
        voteCount: 3,
      ),
    ];

    when(() => datasource.getPopularMovies(language: language, page: page))
        .thenAnswer((_) async => movieModel);

    // Act
    final result = await repository.popular(language: language, page: page);

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<MovieEntity>>());
  });

  test(
      'should return a DataSourceFailure when getPopularMovies throws an Exception',
      () async {
    // Arrange
    when(() => datasource.getPopularMovies(language: language, page: page))
        .thenThrow(Exception());

    // Act
    final result = await repository.popular(language: language, page: page);

    // Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<DataSourceFailure>());
  });

  test('should return a list of TopRated movies', () async {
    // Arrange
    final movieModel = [
      MovieModel(
        id: 1,
        title: 'Test Character',
        posterPath: 'test.com',
        overview: '',
        releaseDate: '',
        voteAverage: 2,
        voteCount: 3,
      ),
    ];

    when(() => datasource.getTopRatedMovies(language: language, page: page))
        .thenAnswer((_) async => movieModel);

    // Act
    final result = await repository.topRated(language: language, page: page);

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<MovieEntity>>());
  });

  test(
      'should return a DataSourceFailure when getTopRatedMovies throws an Exception',
      () async {
    // Arrange
    when(() => datasource.getTopRatedMovies(language: language, page: page))
        .thenThrow(Exception());

    // Act
    final result = await repository.topRated(language: language, page: page);

    // Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<DataSourceFailure>());
  });

  test('should return a list of search movies', () async {
    // Arrange
    final movieModel = [
      MovieModel(
        id: 1,
        title: 'Test Character',
        posterPath: 'test.com',
        overview: '',
        releaseDate: '',
        voteAverage: 2,
        voteCount: 3,
      ),
    ];

    when(() => datasource.searchMovies(
        language: language,
        search: search,
        page: page)).thenAnswer((_) async => movieModel);

    // Act
    final result = await repository.searchMovie(
        language: language, search: search, page: page);

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<MovieEntity>>());
  });

  test(
      'should return a DataSourceFailure when searchMovies throws an Exception',
      () async {
    // Arrange
    when(() => datasource.searchMovies(
        language: language, search: search, page: page)).thenThrow(Exception());

    // Act
    final result = await repository.searchMovie(
        language: language, search: search, page: page);

    // Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<DataSourceFailure>());
  });

  test('should return a list of cast', () async {
    // Arrange
    final castModel = [
      CastModel(
        name: 'Test Character',
        profilePath: 'test.com',
      ),
    ];

    when(() => datasource.getCast(movieId: movieId))
        .thenAnswer((_) async => castModel);

    // Act
    final result = await repository.cast(movieId: movieId);

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<CastEntity>>());
  });

  test('should return a DataSourceFailure when getCast throws an Exception',
      () async {
    // Arrange
    when(() => datasource.getCast(movieId: movieId)).thenThrow(Exception());

    // Act
    final result = await repository.cast(movieId: movieId);

    // Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<DataSourceFailure>());
  });
}
