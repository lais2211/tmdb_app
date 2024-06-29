import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/usecases/cast_usecase.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/usecases/now_playing_movie_usecase.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/usecases/popular_movie_usecase.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/usecases/top_rated_movie_usecase.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/usecases/upcoming_movie_usecase.dart';

import '../../../../core/config/widget_status.dart';
import '../../domain/entities/cast_entity.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  Logger logger = Modular.get();

  final UpcomingMovieUsecase upcomingMovieUsecase;
  final PopularMovieUsecase popularMovieUsecase;
  final NowPLayingMovieUsecase nowPLayingMovieUsecase;
  final TopRatedMovieUsecase topRatedMovieUsecase;

  final CastUsecase castUsecase;

  _HomePageControllerBase(
      this.upcomingMovieUsecase,
      this.popularMovieUsecase,
      this.nowPLayingMovieUsecase,
      this.topRatedMovieUsecase,
      this.castUsecase) {
    initController();
  }

  ObservableList<MovieEntity> popularMovies = ObservableList<MovieEntity>();
  ObservableList<MovieEntity> upComingMovies = ObservableList<MovieEntity>();
  ObservableList<MovieEntity> nowPlayingMovies = ObservableList<MovieEntity>();
  ObservableList<MovieEntity> topRatedMovies = ObservableList<MovieEntity>();
  ObservableList<CastEntity> cast = ObservableList<CastEntity>();

  @observable
  WidgetStatus? appStatus;

  @observable
  WidgetStatus? nowPlayingMoviesStatus;

  @observable
  WidgetStatus? upComingMoviesStatus;

  @observable
  WidgetStatus? popularMoviesStatus;

  @observable
  WidgetStatus? topRatedMoviesStatus;

  final int page = 1;

  @action
  Future<void> getUpComingMovies({required int page}) async {
    upComingMoviesStatus = WidgetStatus.loading;
    var movies = await upcomingMovieUsecase(page: page);
    logger.d('Entrou na função getUpComingMovies');

    movies.fold(
      (left) {
        logger.d('Entrou no left (Failure) da getUpComingMovies.');
        appStatus = WidgetStatus.error;
        upComingMoviesStatus = WidgetStatus.error;
      },
      (right) {
        logger.d('Entrou no right (Sucess) da getUpComingMovies.');
        appStatus = WidgetStatus.sucess;
        upComingMoviesStatus = WidgetStatus.ready;
        upComingMovies.addAll(right);
        return upComingMovies = ObservableList.of(upComingMovies);
      },
    );
  }

  @action
  Future<void> getPopularMovies({required int page}) async {
    popularMoviesStatus = WidgetStatus.loading;
    var movies = await popularMovieUsecase(page: page);
    logger.d('Entrou na função getPopularMovies');

    movies.fold(
      (left) {
        logger.d('Entrou no left (Failure) da getPopularMovies.');
        appStatus = WidgetStatus.error;
        popularMoviesStatus = WidgetStatus.error;
      },
      (right) {
        logger.d('Entrou no right (Sucess) da getPopularMovies.');
        appStatus = WidgetStatus.sucess;
        popularMoviesStatus = WidgetStatus.ready;
        popularMovies.addAll(right);
        return popularMovies = ObservableList.of(popularMovies);
      },
    );
  }

  @action
  Future<void> getNowPlayingMovies({required int page}) async {
    nowPlayingMoviesStatus = WidgetStatus.loading;
    var movies = await nowPLayingMovieUsecase(page: page);
    logger.d('Entrou na função getNowPlayingMovies');

    movies.fold(
      (left) {
        logger.d('Entrou no left (Failure) da getNowPlayingMovies.');
        appStatus = WidgetStatus.error;
        nowPlayingMoviesStatus = WidgetStatus.error;
      },
      (right) {
        logger.d('Entrou no right (Sucess) da getNowPlayingMovies.');
        appStatus = WidgetStatus.sucess;
        nowPlayingMoviesStatus = WidgetStatus.ready;
        nowPlayingMovies.addAll(right);
        return nowPlayingMovies = ObservableList.of(nowPlayingMovies);
      },
    );
  }

  @action
  Future<void> getTopRatedMovies({required int page}) async {
    topRatedMoviesStatus = WidgetStatus.loading;
    var movies = await topRatedMovieUsecase(page: page);
    logger.d('Entrou na função getTopRatedMovies');

    movies.fold(
      (left) {
        logger.d('Entrou no left (Failure) da getTopRatedMovies.');
        topRatedMoviesStatus = WidgetStatus.error;
        appStatus = WidgetStatus.error;
      },
      (right) {
        logger.d('Entrou no right (Sucess) da getTopRatedMovies.');
        appStatus = WidgetStatus.sucess;
        topRatedMoviesStatus = WidgetStatus.ready;
        topRatedMovies.addAll(right);
        return topRatedMovies = ObservableList.of(topRatedMovies);
      },
    );
  }

  @action
  Future<void> getCast({required int movieId}) async {
    var movies = await castUsecase(movieId: movieId);
    logger.d('Entrou na função getCast');

    movies.fold(
      (left) {
        logger.d('Entrou no left (Failure) da getCast.');
        appStatus = WidgetStatus.error;
      },
      (right) {
        appStatus = WidgetStatus.sucess;
        logger.d('Entrou no right (Sucess) da getCast.');
        cast.addAll(right);
        return cast = ObservableList.of(cast);
      },
    );
  }

  @action
  Future<void> initController() async {
    await getNowPlayingMovies(page: page);
    await getPopularMovies(page: page);
    await getTopRatedMovies(page: page);
    await getUpComingMovies(page: page);
  }
}
