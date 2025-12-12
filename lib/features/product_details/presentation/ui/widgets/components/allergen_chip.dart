import 'package:flutter/material.dart';

class AllergenChip extends StatelessWidget {
  const AllergenChip({required this.allergens, super.key});

  final String allergens;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amber.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.warning, size: 16),
                const SizedBox(width: 6),
                Text(allergens),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
