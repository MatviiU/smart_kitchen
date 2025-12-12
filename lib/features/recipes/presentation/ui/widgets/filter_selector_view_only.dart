import 'package:flutter/material.dart';

class FilterSelectorViewOnly extends StatelessWidget {
  const FilterSelectorViewOnly({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Widget chip(String label, {required bool selected}) {
      return Expanded(
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
          chip('From My Ingredients', selected: true),
          const SizedBox(width: 6),
          chip('Favorites', selected: false),
        ],
      ),
    );
  }
}
