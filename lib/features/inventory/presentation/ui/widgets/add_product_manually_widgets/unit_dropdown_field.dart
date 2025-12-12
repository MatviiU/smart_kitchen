import 'package:flutter/material.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/custom_text_form_field.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/add_product_manually_widgets/unit_dropdown_button.dart';

class UnitDropdownField extends StatelessWidget {
  const UnitDropdownField({
    required this.quantityController,
    required this.validator,
    required this.initialValue,
    required this.onChanged,
    super.key,
  });

  final TextEditingController quantityController;
  final FormFieldValidator<String?> validator;
  final String initialValue;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CustomTextFormField(
            controller: quantityController,
            labelText: 'Quantity*',
            hintText: 'e.g. 100',
            keyboardType: TextInputType.number,
            validator: validator,
          ),
        ),
        const SizedBox(width: 12),
        UnitDropdownButton(initialValue: initialValue, onChanged: onChanged),
      ],
    );
  }
}
