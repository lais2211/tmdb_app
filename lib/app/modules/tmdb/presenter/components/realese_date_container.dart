import 'package:flutter/material.dart';

import '../../l10n/movie_l10n.dart';

class ReleaseDateContainer extends StatelessWidget {
  final String releaseDate;

  final MovieL10n text = MovieL10n();

  ReleaseDateContainer({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            text.nowPlayingMovies,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            releaseDate,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
