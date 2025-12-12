import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_cubit.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_state.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/components/filter_chips_item.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({required this.filter, super.key});

  final InventoryFilter filter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          FilterChipsItem(
            filterOption: InventoryFilter.all,
            label: 'All',
            filter: filter,
            onTap: () {
              context.read<InventoryCubit>().setFilter(
                filter: InventoryFilter.all,
              );
            },
          ),
          FilterChipsItem(
            filterOption: InventoryFilter.expiringSoon,
            label: 'Expiring soon',
            filter: filter,
          ),
          FilterChipsItem(
            filterOption: InventoryFilter.expired,
            label: 'Expired',
            filter: filter,
          ),
          FilterChipsItem(
            filterOption: InventoryFilter.favorites,
            label: 'Favorites',
            filter: filter,
            onTap: () {
              context.read<InventoryCubit>().setFilter(
                filter: InventoryFilter.favorites,
              );
            },
          ),
        ],
      ),
    );
  }
}
