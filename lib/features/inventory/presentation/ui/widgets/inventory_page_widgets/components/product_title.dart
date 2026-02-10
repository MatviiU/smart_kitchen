import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({required this.product, super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            '${product.quantity} - ${product.brand} - '
            '${DateFormat('dd-MM-yyyy').format(product.expirationDate ?? DateTime.now())}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
