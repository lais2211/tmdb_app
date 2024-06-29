import 'package:flutter/material.dart';
import 'package:tmdb_app/app/core/config/config_env.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';

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
              child: GestureDetector(
                onTap: () => onTap(actualMovie),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 100,
                    width: 150,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${ConfigEnv.imagePath}${actualMovie.posterPath}',
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/noImage.jpg',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
