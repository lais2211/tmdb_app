import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/app/modules/tmdb/infra/datasource/movie_datasource.dart';
import 'package:tmdb_app/app/modules/tmdb/infra/models/cast_model.dart';
import 'package:tmdb_app/app/modules/tmdb/infra/models/movie_model.dart';

import '../../../../core/errors/errors.dart';
import '../../l10n/movie_l10n.dart';

class MovieDatasourceImpl implements MovieDatasource {
  Dio dio;
  Logger logger;
  final MovieL10n text = MovieL10n();

  MovieDatasourceImpl({required this.dio, required this.logger});

  String statusCodeToMessage(int statusCode) {
    switch (statusCode) {
      case 200:
        return text.sucess;
      case 404:
        return text.notFound;
      case 500:
        return text.serverError;
      default:
        return text.unknownError;
    }
  }

  @override
  Future<List<CastModel>> getCast({required int movieId}) async {
    try {
      final response = await dio.get(
        'movie/$movieId/credits',
      );

      final statusCode = response.statusCode!;

      if (statusCode == 200) {
        logger.d('O if da função getCast da external foi validado.');
        logger.d('O movieId é : $movieId');
        List<CastModel> castList = [];

        List results = response.data['cast'];

        castList = results.map((e) => CastModel.fromMap(e)).toList();

        return castList;
      }
      throw DataSourceFailure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies(
      {required int page}) async {
    try {
      final queryParams = {'page': page};

      final response = await dio.get(
        'movie/now_playing',
        queryParameters: queryParams,
      );

      final statusCode = response.statusCode!;

      if (statusCode == 200) {
        logger
            .d('O if da função getNowPlayingMovies da external foi validado.');
        List<MovieModel> movieList = [];

        List results = response.data['results'];

        movieList = results.map((e) => MovieModel.fromMap(e)).toList();

        return movieList;
      }
      throw DataSourceFailure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies(
      {required int page}) async {
    try {
      final queryParams = {'page': page};

      final response = await dio.get(
        'movie/popular',
        queryParameters: queryParams,
      );

      final statusCode = response.statusCode!;

      if (statusCode == 200) {
        logger.d('O if da função getPopularMovies da external foi validado.');
        List<MovieModel> movieList = [];

        List results = response.data['results'];

        movieList = results.map((e) => MovieModel.fromMap(e)).toList();

        return movieList;
      }
      throw DataSourceFailure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies(
      {required int page}) async {
    try {
      final queryParams = {'page': page};

      final response = await dio.get(
        'movie/top_rated',
        queryParameters: queryParams,
      );

      final statusCode = response.statusCode!;

      if (statusCode == 200) {
        logger.d('O if da função getTopRatedMovies da external foi validado.');
        List<MovieModel> movieList = [];

        List results = response.data['results'];

        movieList = results.map((e) => MovieModel.fromMap(e)).toList();

        return movieList;
      }
      throw DataSourceFailure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies(
      {required int page}) async {
    try {
      final queryParams = {'page': page};

      final response = await dio.get(
        'movie/upcoming',
        queryParameters: queryParams,
      );

      final statusCode = response.statusCode!;

      if (statusCode == 200) {
        logger.d('O if da função getUpcomingMovies da external foi validado.');
        List<MovieModel> movieList = [];

        List results = response.data['results'];

        movieList = results.map((e) => MovieModel.fromMap(e)).toList();

        return movieList;
      }
      throw DataSourceFailure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(
      {required String search,
      required int page}) async {
    try {
      final queryParams = {
        'query': search,
        'page': page,
      };

      final response = await dio.get(
        'search/multi',
        queryParameters: queryParams,
      );

      final statusCode = response.statusCode!;

      if (statusCode == 200) {
        logger.d('O if da função getUpcomingMovies da external foi validado.');
        List<MovieModel> movieList = [];

        List results = response.data['results'];

        movieList = results.map((e) => MovieModel.fromMap(e)).toList();

        return movieList;
      }
      throw DataSourceFailure(
          errorCode: statusCode, errorMessage: statusCodeToMessage(statusCode));
    } catch (e) {
      throw InternalServerError(text.error);
    }
  }
}
