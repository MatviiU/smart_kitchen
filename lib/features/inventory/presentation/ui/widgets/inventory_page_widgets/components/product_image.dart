import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({required this.product, super.key});

  final ProductEntity product;

  String get _imagePath => product.imageUrl.trim();

  bool get _hasImage => _imagePath.isNotEmpty;

  bool get _isNetworkImage => _imagePath.startsWith('http');

  @override
  Widget build(BuildContext context) {
    final file = File(_imagePath);
    final hasLocalFile = !_isNetworkImage && file.existsSync();

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 64,
        height: 64,
        child: !_hasImage
            ? _placeholder()
            : _isNetworkImage
            ? Image.network(
                _imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _placeholder(),
              )
            : hasLocalFile
            ? Image.file(
                file,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _placeholder(),
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
