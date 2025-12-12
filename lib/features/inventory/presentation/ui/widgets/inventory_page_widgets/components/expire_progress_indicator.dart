import 'package:flutter/material.dart';
import 'package:smart_kitchen/core/theme/build_context_extension.dart';

class ExpireProgressIndicator extends StatelessWidget {
  const ExpireProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        minHeight: 10,
        backgroundColor: context.colors.surfaceContainerHigh,
        value: 0.8, // TODO: замінити на динамічне значення
        valueColor: AlwaysStoppedAnimation<Color>(context.colors.error),
      ),
    );
  }

  // Color _getProgressColor(BuildContext context) {
  //   if (value >= 1.0) {
  //     return context.colors.error; // Вже зіпсувалося (Червоний)
  //   } else if (value >= 0.7) {
  //     return const Color(0xFFE6A23C); // Warning (М'який помаранчевий, хардкод або додай в тему)
  //     // Або якщо хочеш строго по темі:
  //     // return context.colors.error.withOpacity(0.7);
  //   } else {
  //     return context.colors.primary; // Все добре (Indigo)
  //     // Або зелений, якщо хочеш чіткіше: const Color(0xFF67C23A);
  //   }
  // }
}
