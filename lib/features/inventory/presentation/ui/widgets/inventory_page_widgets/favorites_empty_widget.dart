import 'package:flutter/material.dart';
import 'package:smart_kitchen/core/theme/build_context_extension.dart';

class FavoritesEmptyWidget extends StatelessWidget {
  const FavoritesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: Icon(
              Icons.heart_broken,
              size: 72,
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Nothing found',
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Try adjusting your filters, '
            'or add products to your Favorites to see them here.',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
