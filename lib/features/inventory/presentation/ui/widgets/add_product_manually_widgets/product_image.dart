import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
        child: const Center(
          child: Icon(Icons.photo_library_outlined, size: 48),
        ),
      ),
    );
  }
}
