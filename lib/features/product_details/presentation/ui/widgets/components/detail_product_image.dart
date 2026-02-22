import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';

class DetailProductImage extends StatelessWidget {
  const DetailProductImage({required this.product, super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final imagePath = product.imageUrl.trim();
    final hasImage = imagePath.isNotEmpty;
    final isNetworkImage = imagePath.startsWith('http');
    final localFile = File(imagePath);
    final hasLocalFile = !isNetworkImage && localFile.existsSync();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: !hasImage
              ? ColoredBox(
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                )
              : isNetworkImage
              ? Image.network(
                  imagePath,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => ColoredBox(
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                  ),
                )
              : hasLocalFile
              ? Image.file(
                  localFile,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => ColoredBox(
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                  ),
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
