import 'package:flutter/material.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/components/allergen_chip.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/components/ingredients_text.dart';

class IngredientsAllergensSection extends StatelessWidget {
  const IngredientsAllergensSection({
    required this.allergens,
    required this.ingredients,
    super.key,
  });

  final String ingredients;
  final String allergens;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Ingredients & Allergens'),
        ),
        IngredientsText(ingredients: ingredients),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Allergens'),
        ),
        AllergenChip(allergens: allergens),
      ],
    );
  }
}
