import 'package:flutter/material.dart';

class FavoritesEmptyWidget extends StatelessWidget {
  const FavoritesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 64, color: colors.onSurfaceVariant),
          const SizedBox(height: 12),
          Text(
            'No favorite recipes yet',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge?.copyWith(color: colors.onSurface),
          ),
          const SizedBox(height: 6),
          Text(
            'Tap the heart on any recipe and it will appear here.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
