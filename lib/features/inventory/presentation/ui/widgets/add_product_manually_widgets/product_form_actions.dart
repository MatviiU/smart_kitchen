import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductFormActions extends StatelessWidget {
  const ProductFormActions({required this.onSave, super.key});

  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: context.pop,
            child: const Text('Cancel'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: onSave,
            child: const Text('Save product'),
          ),
        ),
      ],
    );
  }
}
