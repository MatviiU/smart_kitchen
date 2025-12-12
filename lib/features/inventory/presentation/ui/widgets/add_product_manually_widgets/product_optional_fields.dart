import 'package:flutter/material.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/custom_text_form_field.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/nutrition_fields.dart';

class ProductOptionalFields extends StatelessWidget {
  const ProductOptionalFields({
    required this.caloriesController,
    required this.carbsController,
    required this.fatController,
    required this.proteinController,
    required this.categoriesController,
    required this.allergensController,
    required this.ingredientsController,
    super.key,
  });

  final TextEditingController categoriesController;
  final TextEditingController allergensController;
  final TextEditingController ingredientsController;
  final TextEditingController caloriesController;
  final TextEditingController fatController;
  final TextEditingController carbsController;
  final TextEditingController proteinController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        CustomTextFormField(
          controller: categoriesController,
          labelText: 'Categories',
          hintText: 'e.g. Snacks, Dairy, Produce',
        ),
        CustomTextFormField(
          controller: allergensController,
          labelText: 'Allergens',
          hintText: 'e.g. Nuts, Gluten',
        ),
        CustomTextFormField(
          controller: ingredientsController,
          labelText: 'Ingredients',
          hintText: 'List the ingredients...',
          maxLines: 4,
        ),
        NutritionFields(
          caloriesController: caloriesController,
          carbsController: carbsController,
          fatController: fatController,
          proteinController: proteinController,
        ),
      ],
    );
  }
}
