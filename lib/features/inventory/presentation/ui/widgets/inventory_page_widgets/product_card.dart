import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_kitchen/core/navigation/route_names.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/components/expire_progress_indicator.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/components/product_action_buttons.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/components/product_image.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/widgets/inventory_page_widgets/components/product_title.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        RouteNames.productDetailsPage,
        pathParameters: {'barcode': product.barcode},
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProductImage(product: product),
                  const SizedBox(width: 12),
                  ProductTitle(product: product),
                  ProductActionButtons(product: product),
                ],
              ),
              const SizedBox(height: 12),
              ExpireProgressIndicator(expirationDate: product.expirationDate),
            ],
          ),
        ),
      ),
    );
  }
}
