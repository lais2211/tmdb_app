import 'package:flutter/material.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';

import 'movie_card.dart';

class HorizontalSlider extends StatelessWidget {
  final Function(MovieEntity) onTap;
  const HorizontalSlider(
      {super.key, required this.movies, required this.onTap});

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            var actualMovie = movies[index];

            return Padding(
              padding: const EdgeInsets.all(8),
              child: MovieCard(onTap: onTap, actualMovie: actualMovie, height: 100, widht: 150, isSearch: false,),
            );
          }),
    );
  }
}

