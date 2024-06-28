import 'package:flutter_modular/flutter_modular.dart';
import 'core/config/register_dio.dart';
import 'core/config/register_logger.dart';
import 'modules/tmdb_app/domain/repositories/movie_repository.dart';
import 'modules/tmdb_app/domain/usecases/cast_usecase.dart';
import 'modules/tmdb_app/domain/usecases/now_playing_movie_usecase.dart';
import 'modules/tmdb_app/domain/usecases/popular_movie_usecase.dart';
import 'modules/tmdb_app/domain/usecases/search_movies_usecase.dart';
import 'modules/tmdb_app/domain/usecases/top_rated_movie_usecase.dart';
import 'modules/tmdb_app/domain/usecases/upcoming_movie_usecase.dart';
import 'modules/tmdb_app/external/datasources/movie_datasource_impl.dart';
import 'modules/tmdb_app/infra/datasource/movie_datasource.dart';
import 'modules/tmdb_app/infra/repositories/movie_repository_impl.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(() => registerDio());
    i.add(() => registerLogger());
    i.add<UpcomingMovieUsecase>(UpcomingMovieUsecaseImpl.new);
    i.add<PopularMovieUsecase>(PopularMovieUsecaseImpl.new);
    i.add<TopRatedMovieUsecase>(TopRatedMovieUsecaseImpl.new);
    i.add<NowPLayingMovieUsecase>(NowPLayingMovieUsecaseImpl.new);
    i.add<CastUsecase>(CastUsecaseImpl.new);
    i.add<SearchMoviesUsecase>(SearchMoviesUsecaseImpl.new);
    i.add<MovieRepository>(MovieRepositoryImpl.new);
    i.add<MovieDatasource>(MovieDatasourceImpl.new);
      }

  @override
  void routes(r) {
   
  }
}
