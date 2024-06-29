import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/app/core/config/register_logger.dart';
import '../../core/config/register_dio.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/cast_usecase.dart';
import 'domain/usecases/now_playing_movie_usecase.dart';
import 'domain/usecases/popular_movie_usecase.dart';
import 'domain/usecases/search_movies_usecase.dart';
import 'domain/usecases/top_rated_movie_usecase.dart';
import 'domain/usecases/upcoming_movie_usecase.dart';
import 'external/datasources/movie_datasource_impl.dart';
import 'infra/datasource/movie_datasource.dart';
import 'infra/repositories/movie_repository_impl.dart';
import 'presenter/controllers/home_page_controller.dart';
import 'presenter/controllers/more_movies_page_controller.dart';
import 'presenter/controllers/search_page_controller.dart';
import 'presenter/pages/description_page.dart';
import 'presenter/pages/error_page.dart';
import 'presenter/pages/home_page.dart';
import 'presenter/pages/more_movies_page.dart';
import 'presenter/pages/search_page.dart';

class TmdbModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<Logger>(() => registerLogger());
    i.addSingleton<Dio>(() => registerDio());
    i.add<UpcomingMovieUsecase>(UpcomingMovieUsecaseImpl.new);
    i.add<PopularMovieUsecase>(PopularMovieUsecaseImpl.new);
    i.add<TopRatedMovieUsecase>(TopRatedMovieUsecaseImpl.new);
    i.add<NowPLayingMovieUsecase>(NowPLayingMovieUsecaseImpl.new);
    i.add<CastUsecase>(CastUsecaseImpl.new);
    i.add<SearchMoviesUsecase>(SearchMoviesUsecaseImpl.new);
    i.add<MovieRepository>(MovieRepositoryImpl.new);
    i.add<MovieDatasource>(MovieDatasourceImpl.new);
    i.addSingleton<HomePageController>(HomePageController.new);
    i.add<SearchPageController>(SearchPageController.new);
    i.addSingleton<MoreMoviesPageController>(MoreMoviesPageController.new);
  }

  @override
  void routes(r) {
    r.child('/home', child: (context) => const HomePage());
    r.child('/error', child: (context) => const ErrorPage());
    r.child('/description',
        child: (context) => DescriptionPage(movie: r.args.data));
    r.child('/search',
        child: (context) => SearchPage(searchString: r.args.data));
    r.child(
      '/more',
      child: (context) {
        final args = r.args.data;
        return MoreMoviesPage(
          movies: args['movies'],
          scrollListener: args['scrollListener'],
          status: args['status'],
        );
      },
    );
  }
}
