import 'package:flutter/material.dart';

import '../../../../core/config/config_env.dart';
import '../../domain/entities/movie_entity.dart';
import '../../l10n/movie_l10n.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({
    super.key,
    required this.onTap,
    required this.actualMovie,
    this.height,
    this.widht,
    this.errorHeight,
    this.errorWidht,
    required this.isSearch,
  });

  final Function(MovieEntity) onTap;
  final MovieEntity actualMovie;
  final double? height;
  final double? widht;
  final double? errorHeight;
  final double? errorWidht;
  final bool isSearch;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  final MovieL10n text = MovieL10n();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(widget.actualMovie),
      child: widget.isSearch
          ? Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    height: widget.height,
                    fit: BoxFit.fill,
                    '${ConfigEnv.imagePath}${widget.actualMovie.posterPath}',
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      height: widget.errorHeight,
                      width: widget.errorWidht,
                      'assets/images/noImage.jpg',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.actualMovie.title ?? text.descriptionErrorTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: widget.height,
                width: widget.widht,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${ConfigEnv.imagePath}${widget.actualMovie.posterPath}',
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/noImage.jpg',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
    );
  }
}
