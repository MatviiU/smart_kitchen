import 'package:flutter/material.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_state.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/favorites_empty_widget.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/inventory_empty_widget.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/product_card.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({
    required this.filter,
    required this.products,
    super.key,
  });

  final InventoryFilter filter;
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    final filteredProducts = filter == InventoryFilter.favorites
        ? products.where((product) => product.isFavorite).toList()
        : products;
    return Expanded(
      child: products.isEmpty
          ? const InventoryEmptyWidget()
          : filter == InventoryFilter.favorites && filteredProducts.isEmpty
          ? const FavoritesEmptyWidget()
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductCard(product: product);
              },
            ),
    );
  }
}
