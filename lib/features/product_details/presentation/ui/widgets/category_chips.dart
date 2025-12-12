import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}
