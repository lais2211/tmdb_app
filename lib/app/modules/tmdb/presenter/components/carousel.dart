import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/movie_card.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    required this.movies,
  });

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

            return MovieCard(
              onTap: (actualMovie) {
                Modular.to
                    .pushNamed('/tmdb/description', arguments: actualMovie);
              },
              actualMovie: actualMovie,
              errorHeight: 250,
              isSearch: false,
            );
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
