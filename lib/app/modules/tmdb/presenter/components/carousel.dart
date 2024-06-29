import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_app/app/core/config/config_env.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    bool isLargeScreen = screenWidth >= 800;
    double carouselHeight = screenHeight * 0.5;

    return Center(
      child: SizedBox(
        width: isLargeScreen ? screenWidth * 0.8 : screenWidth,
        child: CarouselSlider.builder(
          itemCount: movies.length,
          itemBuilder: (context, itemIndex, pageViewIndex) {
            var actualMovie = movies[itemIndex];

            return GestureDetector(
                onTap: () {
                  Modular.to
                      .pushNamed('/tmdb/description', arguments: actualMovie);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: carouselHeight,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${ConfigEnv.imagePath}${actualMovie.posterPath}',
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        height: 250,
                        'assets/images/noImage.jpg',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ));
          },
          options: CarouselOptions(
            height: carouselHeight,
            autoPlay: true,
            viewportFraction: isLargeScreen ? 0.4 : 0.55,
            autoPlayCurve: Curves.fastOutSlowIn,
            pageSnapping: true,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
