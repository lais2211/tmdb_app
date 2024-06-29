// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageControllerBase, Store {
  late final _$appStatusAtom =
      Atom(name: '_HomePageControllerBase.appStatus', context: context);

  @override
  WidgetStatus? get appStatus {
    _$appStatusAtom.reportRead();
    return super.appStatus;
  }

  @override
  set appStatus(WidgetStatus? value) {
    _$appStatusAtom.reportWrite(value, super.appStatus, () {
      super.appStatus = value;
    });
  }

  late final _$nowPlayingMoviesStatusAtom = Atom(
      name: '_HomePageControllerBase.nowPlayingMoviesStatus', context: context);

  @override
  WidgetStatus? get nowPlayingMoviesStatus {
    _$nowPlayingMoviesStatusAtom.reportRead();
    return super.nowPlayingMoviesStatus;
  }

  @override
  set nowPlayingMoviesStatus(WidgetStatus? value) {
    _$nowPlayingMoviesStatusAtom
        .reportWrite(value, super.nowPlayingMoviesStatus, () {
      super.nowPlayingMoviesStatus = value;
    });
  }

  late final _$upComingMoviesStatusAtom = Atom(
      name: '_HomePageControllerBase.upComingMoviesStatus', context: context);

  @override
  WidgetStatus? get upComingMoviesStatus {
    _$upComingMoviesStatusAtom.reportRead();
    return super.upComingMoviesStatus;
  }

  @override
  set upComingMoviesStatus(WidgetStatus? value) {
    _$upComingMoviesStatusAtom.reportWrite(value, super.upComingMoviesStatus,
        () {
      super.upComingMoviesStatus = value;
    });
  }

  late final _$popularMoviesStatusAtom = Atom(
      name: '_HomePageControllerBase.popularMoviesStatus', context: context);

  @override
  WidgetStatus? get popularMoviesStatus {
    _$popularMoviesStatusAtom.reportRead();
    return super.popularMoviesStatus;
  }

  @override
  set popularMoviesStatus(WidgetStatus? value) {
    _$popularMoviesStatusAtom.reportWrite(value, super.popularMoviesStatus, () {
      super.popularMoviesStatus = value;
    });
  }

  late final _$topRatedMoviesStatusAtom = Atom(
      name: '_HomePageControllerBase.topRatedMoviesStatus', context: context);

  @override
  WidgetStatus? get topRatedMoviesStatus {
    _$topRatedMoviesStatusAtom.reportRead();
    return super.topRatedMoviesStatus;
  }

  @override
  set topRatedMoviesStatus(WidgetStatus? value) {
    _$topRatedMoviesStatusAtom.reportWrite(value, super.topRatedMoviesStatus,
        () {
      super.topRatedMoviesStatus = value;
    });
  }

  late final _$getUpComingMoviesAsyncAction = AsyncAction(
      '_HomePageControllerBase.getUpComingMovies',
      context: context);

  @override
  Future<void> getUpComingMovies({required int page}) {
    return _$getUpComingMoviesAsyncAction
        .run(() => super.getUpComingMovies(page: page));
  }

  late final _$getPopularMoviesAsyncAction =
      AsyncAction('_HomePageControllerBase.getPopularMovies', context: context);

  @override
  Future<void> getPopularMovies({required int page}) {
    return _$getPopularMoviesAsyncAction
        .run(() => super.getPopularMovies(page: page));
  }

  late final _$getNowPlayingMoviesAsyncAction = AsyncAction(
      '_HomePageControllerBase.getNowPlayingMovies',
      context: context);

  @override
  Future<void> getNowPlayingMovies({required int page}) {
    return _$getNowPlayingMoviesAsyncAction
        .run(() => super.getNowPlayingMovies(page: page));
  }

  late final _$getTopRatedMoviesAsyncAction = AsyncAction(
      '_HomePageControllerBase.getTopRatedMovies',
      context: context);

  @override
  Future<void> getTopRatedMovies({required int page}) {
    return _$getTopRatedMoviesAsyncAction
        .run(() => super.getTopRatedMovies(page: page));
  }

  late final _$getCastAsyncAction =
      AsyncAction('_HomePageControllerBase.getCast', context: context);

  @override
  Future<void> getCast({required int movieId}) {
    return _$getCastAsyncAction.run(() => super.getCast(movieId: movieId));
  }

  @override
  String toString() {
    return '''
appStatus: ${appStatus},
nowPlayingMoviesStatus: ${nowPlayingMoviesStatus},
upComingMoviesStatus: ${upComingMoviesStatus},
popularMoviesStatus: ${popularMoviesStatus},
topRatedMoviesStatus: ${topRatedMoviesStatus}
    ''';
  }
}
