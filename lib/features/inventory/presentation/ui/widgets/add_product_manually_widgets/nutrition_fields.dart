import 'package:flutter/material.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/custom_text_form_field.dart';
import 'package:smart_kitchen/utils/validator.dart';

class NutritionFields extends StatelessWidget {
  const NutritionFields({
    required this.caloriesController,
    required this.carbsController,
    required this.fatController,
    required this.proteinController,
    super.key,
  });

  final TextEditingController caloriesController;
  final TextEditingController fatController;
  final TextEditingController carbsController;
  final TextEditingController proteinController;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Nutrition (per 100g)'),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  labelText: 'Calories (kcal)',
                  hintText: 'e.g. 250',
                  controller: caloriesController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (calories) =>
                      Validator.validateNutrition(value: calories),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomTextFormField(
                  labelText: 'Protein (g)',
                  hintText: 'e.g. 5.0',
                  controller: proteinController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (protein) =>
                      Validator.validateNutrition(value: protein),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: fatController,
                  labelText: 'Fat (g)',
                  hintText: 'e.g. 10.0',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (fat) => Validator.validateNutrition(value: fat),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomTextFormField(
                  controller: carbsController,
                  labelText: 'Carbs (g)',
                  hintText: 'e.g. 30.0',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (carbs) =>
                      Validator.validateNutrition(value: carbs),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
