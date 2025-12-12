import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_kitchen/core/di/get_it/di_container.dart';
import 'package:smart_kitchen/core/navigation/route_names.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/screens/add_product_manually_screen.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/screens/inventory_page.dart';
import 'package:smart_kitchen/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/screens/product_details_screen.dart';

final router = GoRouter(
  initialLocation: '/inventory-page',
  routes: [
    GoRoute(
      path: '/inventory-page',
      name: RouteNames.inventoryPage,
      builder: (context, state) => const InventoryPage(),
      routes: [
        GoRoute(
          path: 'add-product-manually-page',
          name: RouteNames.addProductManuallyPage,
          builder: (context, state) {
            final productToEdit = state.extra as ProductEntity?;
            return AddProductManuallyScreen(
              prefilledName: productToEdit?.name,
              prefilledBarcode: productToEdit?.barcode,
              prefilledBrand: productToEdit?.brand,
              prefilledQuantity: productToEdit?.quantity,
              prefilledCategories: productToEdit?.categories,
              prefilledIngredients: productToEdit?.ingredients,
              prefilledAllergens: productToEdit?.allergens,
              prefilledCalories: productToEdit?.nutrition.calories,
              prefilledFat: productToEdit?.nutrition.fat,
              prefilledCarbs: productToEdit?.nutrition.carbs,
              prefilledProtein: productToEdit?.nutrition.protein,
            );
          },
        ),
        GoRoute(
          path: 'product-details-page/:barcode',
          name: RouteNames.productDetailsPage,
          builder: (context, state) {
            final barcode = state.pathParameters['barcode']!;
            return BlocProvider(
              create: (context) =>
                  serviceLocator<ProductDetailsCubit>()
                    ..fetchProduct(barcode: barcode),
              child: ProductDetailsScreen(barcode: barcode),
            );
          },
        ),
      ],
    ),
  ],
);
