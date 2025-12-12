import 'package:flutter/material.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({required this.product, super.key});

  final ProductEntity product;

  bool get _hasImage =>
      product.imageUrl.isNotEmpty && product.imageUrl.trim().startsWith('http');

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 64,
        height: 64,
        child: _hasImage
            ? Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              )
            : _placeholder(),
      ),
    );
  }

  Widget _placeholder() {
    return ColoredBox(
      color: Colors.grey.shade200,
      child: const Icon(
        Icons.image_not_supported_outlined,
        size: 64,
        color: Colors.grey,
      ),
    );
  }
}
