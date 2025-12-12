import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_kitchen/core/navigation/route_names.dart';
import 'package:smart_kitchen/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:smart_kitchen/features/product_details/presentation/cubit/product_details_state.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({required this.barcode, super.key});

  final String barcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              final state = context.read<ProductDetailsCubit>().state;
              if (state is ProductDetailsLoaded) {
                final product = state.product;
                context.pushNamed(
                  RouteNames.addProductManuallyPage,
                  extra: product,
                );
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          late final Widget content;
          switch (state) {
            case ProductDetailsInitial() || ProductDetailsLoading():
              content = const Center(child: CircularProgressIndicator());
            case ProductDetailsLoaded(product: final product):
              content = ProductDetailsBody(product: product);
            case ProductDetailsError():
              const Center(child: Text('Error loading product details'));
          }
          return content;
        },
      ),
    );
  }
}
