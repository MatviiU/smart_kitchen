import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({required this.imagePath, super.key});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final path = imagePath?.trim();
    final hasImage = path != null && path.isNotEmpty;
    final isNetworkImage = hasImage && path.startsWith('http');

    return Center(
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
        clipBehavior: Clip.antiAlias,
        child: hasImage
            ? isNetworkImage
                  ? Image.network(
                      path,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                            child: Icon(Icons.broken_image_outlined, size: 40),
                          ),
                    )
                  : Image.file(
                      File(path),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                            child: Icon(Icons.broken_image_outlined, size: 40),
                          ),
                    )
            : const Center(child: Icon(Icons.photo_library_outlined, size: 48)),
      ),
    );
  }
}
