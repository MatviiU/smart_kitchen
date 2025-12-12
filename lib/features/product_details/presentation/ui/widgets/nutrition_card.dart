import 'package:flutter/material.dart';

class NutritionCard extends StatelessWidget {
  const NutritionCard({required this.title, required this.value, super.key});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;

    switch (title.toLowerCase()) {
      case 'calories':
        icon = Icons.local_fire_department;
        iconColor = Colors.redAccent;
      case 'protein':
        icon = Icons.lunch_dining;
        iconColor = Colors.green;
      case 'fat':
        icon = Icons.water_drop;
        iconColor = Colors.orange;
      default:
        icon = Icons.bolt;
        iconColor = Colors.blue;
    }
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 18),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
          const SizedBox(height: 8),
          Text(value),
        ],
      ),
    );
  }
}
