import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_kitchen/core/navigation/route_names.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_cubit.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_state.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/filter_chips.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/inventory_fab.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/inventory_list.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/search_bar.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        centerTitle: false,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (result) {
              switch (result) {
                case 'recipes':
                  context.goNamed(RouteNames.recipesPage);
                case 'inventory':
                  context.goNamed(RouteNames.inventoryPage);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'recipes', child: Text('Recipes')),
              const PopupMenuItem(value: 'inventory', child: Text('Inventory')),
            ],
          ),
        ],
      ),
      body: BlocConsumer<InventoryCubit, InventoryState>(
        listener: (context, state) {
          if (state is InventoryProductNotFound) {
            final isCurrentRoute = ModalRoute.of(context)?.isCurrent ?? false;
            if (!isCurrentRoute) {
              return;
            }
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Product not found. Please add it manually.'),
              ),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            InventoryInitial() || InventoryLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            InventoryLoaded(
              products: final allProducts,
              filter: final activeFilter,
            ) =>
              SafeArea(
                child: Column(
                  children: [
                    const CustomSearchBar(),
                    FilterChips(filter: activeFilter),
                    InventoryList(filter: activeFilter, products: allProducts),
                  ],
                ),
              ),
            InventoryError() => Center(child: Text(state.message)),
            InventoryProductNotFound() => const SizedBox.shrink(),
          };
        },
      ),
      floatingActionButton: const InventoryFab(),
    );
  }
}
