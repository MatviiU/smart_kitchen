import 'package:flutter/material.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/favorite_icon.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    required this.title,
    required this.meta,
    required this.imageUrl,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onTap,
    super.key,
  });

  final String title;
  final String meta;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Ink.image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
                child: const SizedBox.expand(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                      IconButton(
                        onPressed: onFavoriteTap,
                        icon: FavoriteIcon(
                          variant: isFavorite
                              ? FavoriteIconVariant.filledPrimary
                              : FavoriteIconVariant.outline,
                          color: scheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    meta,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[300]
                          : const Color(0xFF618961),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
