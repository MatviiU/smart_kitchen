import 'package:flutter/material.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/image_picker_row.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/product_image.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/product_optional_fields.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/product_required_fields.dart';

class ProductAddManuallyFormBody extends StatelessWidget {
  const ProductAddManuallyFormBody({
    required this.caloriesController,
    required this.carbsController,
    required this.fatController,
    required this.proteinController,
    required this.nameController,
    required this.brandController,
    required this.quantityController,
    required this.categoriesController,
    required this.allergensController,
    required this.ingredientsController,
    required this.barcodeController,
    required this.unit,
    required this.onChanged,
    super.key,
  });

  final TextEditingController nameController;
  final TextEditingController brandController;
  final TextEditingController quantityController;
  final TextEditingController categoriesController;
  final TextEditingController allergensController;
  final TextEditingController ingredientsController;
  final TextEditingController barcodeController;
  final TextEditingController caloriesController;
  final TextEditingController fatController;
  final TextEditingController carbsController;
  final TextEditingController proteinController;
  final String unit;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProductImage(),
        const SizedBox(height: 16),
        const ImagePickerRow(),
        const SizedBox(height: 24),
        ProductRequiredFields(
          nameController: nameController,
          brandController: brandController,
          barcodeController: barcodeController,
          quantityController: quantityController,
          unit: unit,
          onChanged: onChanged,
        ),
        const SizedBox(height: 8),
        const Text(
          'Fields marked * are required',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 8),
        const Text(
          'Additional details',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        ProductOptionalFields(
          categoriesController: categoriesController,
          allergensController: allergensController,
          ingredientsController: ingredientsController,
          caloriesController: caloriesController,
          fatController: fatController,
          carbsController: carbsController,
          proteinController: proteinController,
        ),
        const SizedBox(height: 90),
      ],
    );
  }
}
