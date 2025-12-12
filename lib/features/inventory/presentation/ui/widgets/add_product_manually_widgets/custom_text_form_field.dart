import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
    this.maxLines,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
