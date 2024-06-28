import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_app/app/core/config/config_env.dart';
import 'package:tmdb_app/app/core/errors/errors.dart';
import 'package:tmdb_app/app/modules/tmdb/external/datasources/movie_datasource_impl.dart';
import 'package:tmdb_app/app/modules/tmdb/infra/models/cast_model.dart';
import 'package:tmdb_app/app/modules/tmdb/infra/models/movie_model.dart';

import '../../utils/mock.dart';

class DioMock extends Mock implements Dio {}

class LoggerMock extends Mock implements Logger {}

void main() async {
  final dio = DioMock();
  final logger = LoggerMock();
  final datasource = MovieDatasourceImpl(dio: dio, logger: logger);
  const movieId = 123;
  const search = 'test';
  const language = 'pt-BR';
  const page = 1;
  await dotenv.load(fileName: ".env");

  test('should return a list of cast', () async {
    // Arrange
    final queryParams = {'api_key': ConfigEnv.apiKey};
    when(() => dio.get('movie/$movieId/credits', queryParameters: queryParams))
        .thenAnswer((_) async => Response<Map<String, Object>>(
              data: DataSourceMock.castResult,
              requestOptions: RequestOptions(),
              statusCode: 200,
            ));

    // Act
    final result = await datasource.getCast(movieId: movieId);

    // Assert
    expect(result, isA<List<CastModel>>());
    expect(result.isNotEmpty, true);
  });

  test('should return an error when fetching cast', () async {
    // Arrange
    final queryParams = {'api_key': ConfigEnv.apiKey};

    when(() => dio.get(
          'movie/$movieId/credits',
          queryParameters: queryParams,
        )).thenAnswer((_) async => Response<Map<String, dynamic>>(
          data: null,
          requestOptions: RequestOptions(),
          statusCode: 400,
        ));

    // Act
    final future = datasource.getCast(movieId: movieId);

    // Assert
    expect(future, throwsA(isA<DataSourceFailure>()));
  });

  test('should return a list of upcoming movies', () async {
    // Arrange
    final queryParams = {
      'api_key': ConfigEnv.apiKey,
      'language': language,
      'page': page
    };
    when(() => dio.get('movie/upcoming', queryParameters: queryParams))
        .thenAnswer((_) async => Response<Map<String, Object>>(
              data: DataSourceMock.movieResult,
              requestOptions: RequestOptions(),
              statusCode: 200,
            ));

    // Act
    final result =
        await datasource.getUpcomingMovies(language: language, page: page);

    // Assert
    expect(result, isA<List<MovieModel>>());
    expect(result.isNotEmpty, true);
  });

  test('should return an error when fetching upcoming movies', () async {
    // Arrange
    final queryParams = {
      'api_key': ConfigEnv.apiKey,
      'language': language,
      'page': page
    };

    when(() => dio.get(
          'movie/upcoming',
          queryParameters: queryParams,
        )).thenAnswer((_) async => Response<Map<String, dynamic>>(
          data: null,
          requestOptions: RequestOptions(),
          statusCode: 400,
        ));

    // Act
    final future = datasource.getUpcomingMovies(language: language, page: page);

    // Assert
    expect(future, throwsA(isA<DataSourceFailure>()));
  });

  test('should return a list of Popular movies', () async {
    // Arrange
    final queryParams = {
      'api_key': ConfigEnv.apiKey,
      'language': language,
      'page': page
    };
    when(() => dio.get('movie/popular', queryParameters: queryParams))
        .thenAnswer((_) async => Response<Map<String, Object>>(
              data: DataSourceMock.movieResult,
              requestOptions: RequestOptions(),
              statusCode: 200,
            ));

    // Act
    final result =
        await datasource.getPopularMovies(language: language, page: page);

    // Assert
    expect(result, isA<List<MovieModel>>());
    expect(result.isNotEmpty, true);
  });

  test('should return an error when fetching Popular movies', () async {
    // Arrange
    final queryParams = {
      'api_key': ConfigEnv.apiKey,
      'language': language,
      'page': page
    };

    when(() => dio.get(
          'movie/popular',
          queryParameters: queryParams,
        )).thenAnswer((_) async => Response<Map<String, dynamic>>(
          data: null,
          requestOptions: RequestOptions(),
          statusCode: 400,
        ));

    // Act
    final future = datasource.getPopularMovies(language: language, page: page);

    // Assert
    expect(future, throwsA(isA<DataSourceFailure>()));
  });

  test('should return a list of now playing movies', () async {
    // Arrange
    final queryParams = {
      'api_key': ConfigEnv.apiKey,
      'language': language,
      'page': page
    };
    when(() => dio.get('movie/now_playing', queryParameters: queryParams))
        .thenAnswer((_) async => Response<Map<String, Object>>(
              data: DataSourceMock.movieResult,
              requestOptions: RequestOptions(),
              statusCode: 200,
            ));

    // Act
    final result =
        await datasource.getNowPlayingMovies(language: language, page: page);

    // Assert
    expect(result, isA<List<MovieModel>>());
    expect(result.isNotEmpty, true);
  });

  test('should return an error when fetching now playing movies', () async {
    // Arrange
    final queryParams = {
      'api_key': ConfigEnv.apiKey,
      'language': language,
      'page': page
    };

    when(() => dio.get(
          'movie/now_playing',
          queryParameters: queryParams,
        )).thenAnswer((_) async => Response<Map<String, dynamic>>(
          data: null,
          requestOptions: RequestOptions(),
          statusCode: 400,
        ));

    // Act
    final future =
        datasource.getNowPlayingMovies(language: language, page: page);

    // Assert
    expect(future, throwsA(isA<DataSourceFailure>()));
  });

  test('should return a list of top rated movies', () async {
    // Arrange
    final queryParams = {
      'api_key': ConfigEnv.apiKey,
      'language': language,
      'page': page
    };
    when(() => dio.get('movie/top_rated', queryParameters: queryParams))
        .thenAnswer((_) async => Response<Map<String, Object>>(
              data: DataSourceMock.movieResult,
              requestOptions: RequestOptions(),
              statusCode: 200,
            ));

    // Act
    final result =
        await datasource.getTopRatedMovies(language: language, page: page);

    // Assert
    expect(result, isA<List<MovieModel>>());
    expect(result.isNotEmpty, true);
  });

  test('should return an error when fetching top rated movies', () async {
    // Arrange
    final queryParams = {
      'api_key': ConfigEnv.apiKey,
      'language': language,
      'page': page
    };

    when(() => dio.get(
          'movie/top_rated',
          queryParameters: queryParams,
        )).thenAnswer((_) async => Response<Map<String, dynamic>>(
          data: null,
          requestOptions: RequestOptions(),
          statusCode: 400,
        ));

    // Act
    final future = datasource.getTopRatedMovies(language: language, page: page);

    // Assert
    expect(future, throwsA(isA<DataSourceFailure>()));
  });

  test('should return a list of search movies', () async {
    // Arrange
    final queryParams = {
      'api_key': ConfigEnv.apiKey,
      'language': language,
      'query': search,
      'page': page
    };
    when(() => dio.get('search/multi', queryParameters: queryParams))
        .thenAnswer((_) async => Response<Map<String, Object>>(
              data: DataSourceMock.movieResult,
              requestOptions: RequestOptions(),
              statusCode: 200,
            ));

    // Act
    final result = await datasource.searchMovies(
        language: language, search: search, page: page);

    // Assert
    expect(result, isA<List<MovieModel>>());
    expect(result.isNotEmpty, true);
  });

  test('should return an error when fetching search movies', () async {
    // Arrange
    final queryParams = {
      'api_key': ConfigEnv.apiKey,
      'language': language,
      'query': search,
      'page': page
    };

    when(() => dio.get(
          'search/multi',
          queryParameters: queryParams,
        )).thenAnswer((_) async => Response<Map<String, dynamic>>(
          data: null,
          requestOptions: RequestOptions(),
          statusCode: 400,
        ));

    // Act
    final future =
        datasource.searchMovies(language: language, search: search, page: page);

    // Assert
    expect(future, throwsA(isA<DataSourceFailure>()));
  });
}
