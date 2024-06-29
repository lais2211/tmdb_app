import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/search_section.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/controllers/home_page_controller.dart';
import '../../../../theme/base_colors.dart';
import '../../l10n/movie_l10n.dart';
import '../components/horizontal_movies_section.dart';
import '../controllers/search_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  HomePageController controller = Modular.get();
  SearchPageController searchController = Modular.get();

  final MovieL10n text = MovieL10n();
  final BaseColors color = BaseColors();

  @override
  void initState() {
    super.initState();
   controller.initController();
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
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchSection(
                    searchController: searchController.textEditingController,
                    searchText: searchController.textEditingController.text),
                HorizontalMoviesSection(
                  movies: controller.popularMovies,
                  status: controller.popularMoviesStatus,
                  carouselMode: true,
                  scrollListener: (page) {
                    controller.getPopularMovies(
                      page: page,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                HorizontalMoviesSection(
                  sectionLabel: text.nowPlayingMovies,
                  movies: controller.nowPlayingMovies,
                  status: controller.nowPlayingMoviesStatus,
                  scrollListener: (page) {
                    controller.getNowPlayingMovies(
                      page: page,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                HorizontalMoviesSection(
                  sectionLabel: text.topRatedMovies,
                  movies: controller.topRatedMovies,
                  status: controller.topRatedMoviesStatus,
                  scrollListener: (page) {
                    controller.getTopRatedMovies(
                      page: page,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                HorizontalMoviesSection(
                  sectionLabel: text.upComingMovies,
                  movies: controller.upComingMovies,
                  status: controller.upComingMoviesStatus,
                  scrollListener: (page) {
                    controller.getUpComingMovies(
                      page: page,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

}
