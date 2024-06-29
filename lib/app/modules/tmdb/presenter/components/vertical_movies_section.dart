import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';

import '../../../../core/config/config_env.dart';
import '../../../../core/config/widget_status.dart';
import '../../l10n/movie_l10n.dart';

class VerticalMoviesSection extends StatefulWidget {
  final List<MovieEntity> movieList;
  final WidgetStatus isLoading;

  const VerticalMoviesSection(
      {super.key, required this.movieList, required this.isLoading});

  @override
  _VerticalMoviesSectionState createState() => _VerticalMoviesSectionState();
}

class _VerticalMoviesSectionState extends State<VerticalMoviesSection> {
 
 final MovieL10n text = MovieL10n();
 
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20,
              ),
              itemCount: widget.movieList.length,
              itemBuilder: (context, index) {
                final actualMovie = widget.movieList[index];
                return GestureDetector(
                  onTap: () {
                    Modular.to.pushNamed('/tmdb/description',
                        arguments: actualMovie);
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          filterQuality: FilterQuality.high,
                          height: 250,
                          fit: BoxFit.fill,
                          '${ConfigEnv.imagePath}${actualMovie.posterPath}',
                          errorBuilder: (context, error, stackTrace) =>
                             Image.asset(
                              height: 250,
                              width: 170,
                               'assets/images/noImage.jpg',
                               filterQuality: FilterQuality.high,
                               fit: BoxFit.cover,
                             ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        actualMovie.title ?? text.descriptionErrorTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            if (widget.isLoading == WidgetStatus.loading) ...[
              const CircularProgressIndicator()
            ]
          ],
        ),
      );
    });
  }
}
