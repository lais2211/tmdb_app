import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/config/widget_status.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/usecases/search_movies_usecase.dart';
part 'search_page_controller.g.dart';

class SearchPageController = _SearchPageControllerBase
    with _$SearchPageController;

abstract class _SearchPageControllerBase with Store {
  Logger logger = Modular.get();
  final SearchMoviesUsecase searchMoviesUsecase;

  ObservableList<MovieEntity> searchMovies = ObservableList<MovieEntity>();

  _SearchPageControllerBase({required this.searchMoviesUsecase});

  @observable
  TextEditingController textEditingController = TextEditingController();

  @observable
  WidgetStatus? isLoading;

  @observable
  WidgetStatus? appStatus;

  @observable
  bool isSearching = true;

  int page = 1;

  @action
  Future<void> getSearchMovies(
      {required int page,
      required String search}) async {
    var movies = await searchMoviesUsecase(
         page: page, search: search);
    isLoading = WidgetStatus.loading;
    isSearching = true;
    logger.d('Entrou na função getSearchMovies');

    movies.fold(
      (left) {
        logger.d('Entrou no left (Failure) da getSearchMovies.');
        appStatus = WidgetStatus.error;
        isSearching = false;
      },
      (right) {
        logger.d('Entrou no right (Sucess) da getSearchMovies.');
        searchMovies.addAll(right);
        isLoading = WidgetStatus.ready;
        isSearching = false;
        return searchMovies = ObservableList.of(searchMovies);
      },
    );
  }
}
