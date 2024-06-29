import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';

import '../../../../core/config/widget_status.dart';
import '../../../../theme/base_colors.dart';
import '../../l10n/movie_l10n.dart';
import 'carousel.dart';
import 'horizontal_slider.dart';

class HorizontalMoviesSection extends StatelessWidget {
  final String sectionLabel;
  final List<MovieEntity> movies;
  final WidgetStatus? status;
  final bool carouselMode;
  final Function? scrollListener;

  final MovieL10n text = MovieL10n();

   HorizontalMoviesSection({
    super.key,
    this.sectionLabel = '',
    required this.movies,
    this.status,
    this.carouselMode = false,
    this.scrollListener,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (carouselMode) ...[
              Column(
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      text.Popular,
                      style: TextStyle(
                        fontSize: 30,
                        color: BaseColors().textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ] else ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sectionLabel,
                      style: TextStyle(
                        fontSize: 20,
                        color: BaseColors().textColor,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Modular.to.pushNamed(
                          '/tmdb/more',
                          arguments: {
                            'movies': movies,
                            'scrollListener': scrollListener,
                            'status': status,
                          },
                        );
                      },
                      child: Text(text.more),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 10),
            if (status == WidgetStatus.loading) ...[
              const Center(
                child: CircularProgressIndicator(),
              )
            ],
            if (status == WidgetStatus.ready) ...[
              carouselMode
                  ? Carousel(movies: movies)
                  : HorizontalSlider(
                      movies: movies,
                      onTap: (movie) {
                        Modular.to.pushNamed('/tmdb/description',
                            arguments: movie);
                      })
            ]
          ],
        );
      }
    );
  }
}
