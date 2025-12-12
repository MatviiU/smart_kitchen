import 'package:flutter/material.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/nutrition_card.dart';

class NutritionInfoGrid extends StatelessWidget {
  const NutritionInfoGrid({required this.product, super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.8,
        children: [
          NutritionCard(
            title: 'Calories',
            value: '${product.nutrition.calories.toStringAsFixed(0)} kcal',
          ),
          NutritionCard(
            title: 'Protein',
            value: '${product.nutrition.protein} g',
          ),
          NutritionCard(title: 'Fat', value: '${product.nutrition.fat} g'),
          NutritionCard(title: 'Carbs', value: '${product.nutrition.carbs} g'),
        ],
      ),
    );
  }
}
