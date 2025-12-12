import 'package:flutter/material.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/custom_text_form_field.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/unit_dropdown_field.dart';
import 'package:smart_kitchen/utils/validator.dart';

class ProductRequiredFields extends StatelessWidget {
  const ProductRequiredFields({
    required this.nameController,
    required this.brandController,
    required this.barcodeController,
    required this.quantityController,
    required this.unit,
    required this.onChanged,
    super.key,
  });

  final TextEditingController nameController;
  final TextEditingController brandController;
  final TextEditingController barcodeController;
  final TextEditingController quantityController;
  final String unit;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        CustomTextFormField(
          controller: nameController,
          labelText: 'Product name*',
          hintText: 'Enter product name',
          validator: (name) => Validator.required(value: name),
        ),
        CustomTextFormField(
          controller: brandController,
          labelText: 'Brand*',
          hintText: 'e.g. Ferrero',
          validator: (brand) => Validator.required(value: brand),
        ),
        CustomTextFormField(
          controller: barcodeController,
          labelText: 'Barcode*',
          hintText: 'Enter or scan barcode',
          validator: (barcode) => Validator.required(value: barcode),
        ),
        UnitDropdownField(
          quantityController: quantityController,
          validator: (quantity) => Validator.validateNumber(value: quantity),
          initialValue: unit,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
