import 'package:flutter/material.dart';

class SpaceBar extends StatelessWidget {
  final String posterUrl;

  const SpaceBar({
    super.key,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        child: Image.network(
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
          posterUrl,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            'assets/images/noImage.jpg',
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
