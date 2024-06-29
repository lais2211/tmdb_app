import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/config/widget_status.dart';
part 'more_movies_page_controller.g.dart';

class MoreMoviesPageController = _MoreMoviesPageControllerBase with _$MoreMoviesPageController;

abstract class _MoreMoviesPageControllerBase with Store {
  Logger logger = Modular.get();

  @observable
  WidgetStatus status = WidgetStatus.ready;

  int page = 2;

  @action
  Future<void> getMoreMovies(Function(int) scrollListener) async {
    status = WidgetStatus.loading;

    page++;

    await scrollListener(page);

    status = WidgetStatus.ready;
  }
}