import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hintColor = isDark ? Colors.grey[400]! : const Color(0xFF618961);
    final iconColor = isDark ? Colors.grey[300] : const Color(0xFF618961);
    final fill = isDark ? Colors.white.withValues(alpha: 0.06) : Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: fill,
                hintText: 'Search for recipes',
                hintStyle: TextStyle(
                  color: hintColor,
                ),
                prefixIconColor: iconColor,
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
        ],
      ),
    );
  }
}
