import 'package:flutter/material.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/category_chips.dart';

class CategoryWrap extends StatelessWidget {
  const CategoryWrap({required this.categories, super.key});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: categories
            .map((category) => CategoryChips(label: category))
            .toList(),
      ),
    );
  }
}
