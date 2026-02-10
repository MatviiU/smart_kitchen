import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_kitchen/core/navigation/route_names.dart';
import 'package:smart_kitchen/core/theme/build_context_extension.dart';

class InventoryFab extends StatelessWidget {
  const InventoryFab({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      backgroundColor: context.colors.primary,
      foregroundColor: context.colors.onPrimary,
      spacing: 12,
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      spaceBetweenChildren: 8,
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.edit_outlined),
          label: 'Add manually',
          backgroundColor: context.colors.surfaceContainerHigh,
          foregroundColor: context.colors.primary,

          labelStyle: context.textTheme.labelMedium?.copyWith(
            fontWeight: .w600,
            color: context.colors.onSurface,
          ),
          labelBackgroundColor: context.colors.surface,
          onTap: () {
            context.pushNamed(RouteNames.addProductManuallyPage);
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.qr_code_scanner),
          label: 'Scan barcode',
          backgroundColor: context.colors.surfaceContainerHigh,
          foregroundColor: context.colors.primary,
          labelStyle: context.textTheme.labelMedium?.copyWith(
            fontWeight: .w600,
            color: context.colors.onSurface,
          ),
          onTap: () {
            context.pushNamed(RouteNames.scanningPage);
          },
        ),
      ],
    );
  }
}
