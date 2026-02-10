import 'package:flutter/material.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipes_state.dart';

class FilterSelectorViewOnly extends StatelessWidget {
  const FilterSelectorViewOnly({
    required this.selectedFilter,
    required this.onChanged,
    super.key,
  });

  final RecipesFilter selectedFilter;
  final ValueChanged<RecipesFilter> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Widget chip({
      required String label,
      required bool selected,
      required VoidCallback onTap,
    }) {
      return Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: selected
                  ? scheme.primary
                  : (isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.white),
              borderRadius: BorderRadius.circular(12),
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected
                    ? Colors.black
                    : (isDark ? Colors.white70 : const Color(0xFF618961)),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.08) : Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          chip(
            label: 'From My Ingredients',
            selected: selectedFilter == RecipesFilter.fromMyIngredients,
            onTap: () => onChanged(RecipesFilter.fromMyIngredients),
          ),
          const SizedBox(width: 6),
          chip(
            label: 'Favorites',
            selected: selectedFilter == RecipesFilter.favorites,
            onTap: () => onChanged(RecipesFilter.favorites),
          ),
        ],
      ),
    );
  }
}
