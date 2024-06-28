import 'package:tmdb_app/app/modules/tmdb/infra/models/cast_model.dart';
import '../models/movie_model.dart';

abstract class MovieDatasource {
  Future<List<MovieModel>> getUpcomingMovies(
      {required int page});

  Future<List<MovieModel>> getTopRatedMovies(
      {required int page});

  Future<List<MovieModel>> getNowPlayingMovies(
      {required int page});

  Future<List<MovieModel>> getPopularMovies(
      {required int page});

  Future<List<MovieModel>> searchMovies(
      {required String search, required int page});

  Future<List<CastModel>> getCast({required int movieId});
}
