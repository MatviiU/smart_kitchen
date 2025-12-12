import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_kitchen/core/navigation/route_names.dart';
import 'package:smart_kitchen/core/theme/build_context_extension.dart';

class InventoryEmptyWidget extends StatelessWidget {
  const InventoryEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: Icon(
              Icons.kitchen,
              size: 72,
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your inventory is empty',
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colors.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Add your first product by scanning or manually',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton.tonalIcon(
                onPressed: () {
                  //TODO: start scanning
                },
                style: FilledButton.styleFrom(
                  backgroundColor: context.colors.secondaryContainer,
                  foregroundColor: context.colors.onSecondaryContainer,
                  textStyle: context.textTheme.labelLarge,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text('Scan barcode'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {
                  context.pushNamed(RouteNames.addProductManuallyPage);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.colors.primary,
                  side: BorderSide(color: context.colors.outline),
                  textStyle: context.textTheme.labelLarge,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                icon: const Icon(Icons.edit_note),
                label: const Text('Add manually'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoTile(
                icon: Icons.qr_code_scanner,
                title: 'Scan barcode – quick add',
                context: context,
              ),
              _infoTile(
                icon: Icons.edit_note,
                title: 'Add manually – type details',
                context: context,
              ),
              _infoTile(
                icon: Icons.lightbulb_outline,
                title: 'Tips – storage advice',
                context: context,
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {
              // TODO: link to help screen or show dialog
            },
            child: Text(
              'Learn how to scan →',
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    required BuildContext context,
  }) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: context.colors.primary),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              title,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
