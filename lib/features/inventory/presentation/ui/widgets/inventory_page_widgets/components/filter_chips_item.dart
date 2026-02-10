import 'package:flutter/material.dart';
import 'package:smart_kitchen/core/theme/build_context_extension.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_state.dart';

class FilterChipsItem extends StatelessWidget {
  const FilterChipsItem({
    required this.filterOption,
    required this.label,
    required this.filter,
    super.key,
    this.onTap,
  });

  final InventoryFilter filter;
  final String label;
  final InventoryFilter filterOption;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ActionChip(
        onPressed: onTap,
        label: Text(
          label,
          style: TextStyle(
            color: _getChipLabelColor(
              context: context,
              filterOption: filterOption,
              selectedFilter: filter,
            ),
          ),
        ),
        backgroundColor: _getChipBackgroundColor(
          context: context,
          filterOption: filterOption,
          selectedFilter: filter,
        ),
      ),
    );
  }

  Color _getChipBackgroundColor({
    required BuildContext context,
    required InventoryFilter filterOption,
    required InventoryFilter selectedFilter,
  }) {
    final isSelected = filterOption == selectedFilter;
    return isSelected
        ? context.colors.primary
        : context.colors.surfaceContainerHigh;
  }

  Color _getChipLabelColor({
    required BuildContext context,
    required InventoryFilter filterOption,
    required InventoryFilter selectedFilter,
  }) {
    final isSelected = filterOption == selectedFilter;
    return isSelected
        ? context.colors.onPrimary
        : context.colors.onSurfaceVariant;
  }
}
