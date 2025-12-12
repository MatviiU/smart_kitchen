import 'package:flutter/material.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';

class DetailProductImage extends StatelessWidget {
  const DetailProductImage({required this.product, super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final hasImage =
        product.imageUrl.isNotEmpty &&
        product.imageUrl.trim().startsWith('http');
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: hasImage
              ? Image.network(
                  product.imageUrl,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : ColoredBox(
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                ),
        ),
      ),
    );
  }
}
