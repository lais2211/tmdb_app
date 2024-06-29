import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/vertical_movies_section.dart';

import '../../../../theme/base_colors.dart';
import '../../l10n/movie_l10n.dart';
import '../controllers/home_page_controller.dart';
import '../controllers/search_page_controller.dart';

class SearchPage extends StatefulWidget {
  final String searchString;

  const SearchPage({super.key, required this.searchString});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchPageController searchController = Modular.get();
  HomePageController homePagecontroller = Modular.get();
  Logger logger = Modular.get();

  final MovieL10n text = MovieL10n();
  final BaseColors color = BaseColors();

  final ScrollController _scrollController = ScrollController();

  void infiniteScrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      logger.d('O if da função infiniteScrollListener foi validado.');
      searchController.getSearchMovies(
          page: searchController.page, search: widget.searchString);
      searchController.page += 1;
    }
  }

  @override
  void initState() {
    super.initState();
    searchController.getSearchMovies(
        page: searchController.page, search: widget.searchString);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Resultados para: ${widget.searchString}'),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          child: Observer(builder: (context) {
            return searchController.isSearching
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    child: VerticalMoviesSection(
                        movieList: searchController.searchMovies,
                        isLoading: searchController.isLoading!));
          }),
        ),
      );
    });
  }
}
