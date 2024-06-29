import 'package:flutter/material.dart';

import '../../l10n/movie_l10n.dart';

class RatingContainer extends StatelessWidget {
  final double rating;
  final MovieL10n text = MovieL10n();

  RatingContainer({super.key, required this.rating});

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
            text.avaliation,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '${rating.toStringAsFixed(1)}/10',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
