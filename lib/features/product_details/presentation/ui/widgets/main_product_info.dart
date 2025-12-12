import 'package:flutter/material.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';

class MainProductInfo extends StatelessWidget {
  const MainProductInfo({required this.product, super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(product.name),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          child: Text(product.brand),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(product.barcode),
        ),
      ],
    );
  }
}
