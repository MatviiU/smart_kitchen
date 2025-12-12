import 'package:flutter/material.dart';

class IngredientsText extends StatelessWidget {
  const IngredientsText({required this.ingredients, super.key});

  final String ingredients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(ingredients),
    );
  }
}
