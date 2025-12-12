import 'package:flutter/material.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/category_wrap.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/components/detail_product_image.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/components/nutrition_title.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/ingredients_allergens_section.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/main_product_info.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/nutrition_info_grid.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({required this.product, super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final categories = product.categories
        .split(',')
        .map((category) => category.trim())
        .where((category) => category.isNotEmpty)
        .toList();
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailProductImage(product: product),
          MainProductInfo(product: product),
          CategoryWrap(categories: categories),
          const SizedBox(height: 12),
          IngredientsAllergensSection(
            allergens: product.allergens,
            ingredients: product.ingredients,
          ),
          const SizedBox(height: 12),
          const NutritionTitle(),
          NutritionInfoGrid(product: product),
        ],
      ),
    );
  }
}
