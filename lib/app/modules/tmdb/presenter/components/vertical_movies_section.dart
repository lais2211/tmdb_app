import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/movie_card.dart';

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
                return MovieCard(
                  onTap: (actualMovie) {
                    Modular.to
                        .pushNamed('/tmdb/description', arguments: actualMovie);
                  },
                  actualMovie: actualMovie,
                  isSearch: true,
                  height: 250,
                  errorHeight: 250,
                  errorWidht: 170,
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
