import 'package:flutter/material.dart';

class NutritionTitle extends StatelessWidget {
  const NutritionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text('Nutrition per 100g'),
    );
  }
}
