import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/vertical_movies_section.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/controllers/more_movies_page_controller.dart';

import '../../../../core/config/widget_status.dart';
import '../../../../theme/base_colors.dart';
import '../../domain/entities/movie_entity.dart';
import '../../l10n/movie_l10n.dart';
import '../controllers/home_page_controller.dart';

class MoreMoviesPage extends StatefulWidget {
  final List<MovieEntity> movies;
  final WidgetStatus? status;
  final Function(int) scrollListener;
  const MoreMoviesPage({super.key, required this.movies, this.status, required this.scrollListener});

  @override
  State<MoreMoviesPage> createState() => _MoreMoviesPageState();
}

class _MoreMoviesPageState extends State<MoreMoviesPage> {

  MoreMoviesPageController controller = Modular.get();
  HomePageController homePagecontroller = Modular.get();
  Logger logger = Modular.get();

  final MovieL10n text = MovieL10n();
  final BaseColors color = BaseColors();

  final ScrollController _scrollController = ScrollController();

  void infiniteScrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      logger.d('O if da função infiniteScrollListener foi validado.');
      controller.getMoreMovies(widget.scrollListener);
    }
  }

  @override
  void initState() {
    super.initState();
    controller.page = 1;
    _scrollController.addListener(() => infiniteScrollListener());
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          text.appTitle,
          style: TextStyle(fontSize: 30, color: color.titleColor),
        ),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
         physics:  const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          child:  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalMoviesSection(movieList: widget.movies, isLoading: widget.status!)
              ],
            ),
          ),
        );
      }),
    );
  }

}
