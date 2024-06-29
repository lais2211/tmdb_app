import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_app/app/core/config/config_env.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/cast_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/infra/datasource/movie_datasource.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/horizontal_list_cast.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/space_bar.dart';

import '../../l10n/movie_l10n.dart';
import '../components/rating_container.dart';
import '../components/realese_date_container.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key, required this.movie});

  final MovieEntity movie;

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  late Future<List<CastEntity>> castMovie;
  MovieDatasource movieDatasourceImpl = Modular.get();

  @override
  void initState() {
    super.initState();
    castMovie = movieDatasourceImpl.getCast(movieId: widget.movie.id); }

  final MovieL10n text = MovieL10n();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackButton(),
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.sizeOf(context).height * 0.8,
            pinned: false,
            floating: false,
            flexibleSpace: SpaceBar(
              posterUrl: '${ConfigEnv.imagePath}${widget.movie.posterPath}',
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      widget.movie.title ?? text.descriptionErrorTitle,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        widget.movie.overview ?? text.descriptionErrorOverview,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReleaseDateContainer(
                              releaseDate: widget.movie.releaseDate ?? '',
                            ),
                            RatingContainer(
                                rating: widget.movie.voteAverage ?? 0),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     Text(
                      text.castTitle,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: FutureBuilder(
                          future: castMovie,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(text.descriptionErrorCast),
                              );
                            } else if (snapshot.hasData) {
                              return HorizontalListCast(snapshot: snapshot);
                            } else {
                              if (snapshot.error != null) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else {
                                return Center(
                                  child: Text(text.noDate),
                                );
                              }
                            }
                          }),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
