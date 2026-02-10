import 'package:flutter/material.dart';

enum FavoriteIconVariant { outline, filledPrimary }

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({required this.variant, required this.color, super.key});

  final FavoriteIconVariant variant;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      FavoriteIconVariant.outline => Icon(
        Icons.favorite_border,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      FavoriteIconVariant.filledPrimary => Icon(Icons.favorite, color: color),
    };
  }
}
