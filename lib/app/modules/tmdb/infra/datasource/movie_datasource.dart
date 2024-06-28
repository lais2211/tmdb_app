import 'package:tmdb_app/app/modules/tmdb/infra/models/cast_model.dart';
import '../models/movie_model.dart';

abstract class MovieDatasource {
  Future<List<MovieModel>> getUpcomingMovies(
      {required String language, required int page});

  Future<List<MovieModel>> getTopRatedMovies(
      {required String language, required int page});

  Future<List<MovieModel>> getNowPlayingMovies(
      {required String language, required int page});

  Future<List<MovieModel>> getPopularMovies(
      {required String language, required int page});

  Future<List<MovieModel>> searchMovies(
      {required String language, required String search, required int page});

  Future<List<CastModel>> getCast({required int movieId});
}
