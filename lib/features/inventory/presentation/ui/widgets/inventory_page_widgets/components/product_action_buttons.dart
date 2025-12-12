import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_kitchen/core/navigation/route_names.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_cubit.dart';

class ProductActionButtons extends StatelessWidget {
  const ProductActionButtons({required this.product, super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.pushNamed(
              RouteNames.productDetailsPage,
              pathParameters: {'barcode': product.barcode},
            );
          },
          icon: const Icon(Icons.edit, size: 20),
        ),
        IconButton(
          onPressed: () {
            context.read<InventoryCubit>().removeProduct(
              barcode: product.barcode,
            );
          },
          icon: const Icon(Icons.delete, size: 20),
        ),
        IconButton(
          onPressed: () {
            context.read<InventoryCubit>().toggleFavoriteByBarcode(
              barcode: product.barcode,
            );
          },
          icon: product.isFavorite
              ? const Icon(Icons.favorite, size: 20)
              : const Icon(Icons.favorite_border, size: 20),
        ),
      ],
    );
  }
}
