import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_kitchen/core/di/get_it/di_container.dart';
import 'package:smart_kitchen/core/navigation/route_names.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/screens/add_product_manually_screen.dart';
import 'package:smart_kitchen/features/inventory/presentation/ui/screens/inventory_page.dart';
import 'package:smart_kitchen/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:smart_kitchen/features/product_details/presentation/ui/screens/product_details_screen.dart';
import 'package:smart_kitchen/features/recipes/data/repositories/recipe_repository.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipe_detail_cubit.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/screens/recipe_details_screen.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/screens/recipes_page.dart';
import 'package:smart_kitchen/features/scanning/presentation/ui/screens/scanning_page.dart';

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
            final extra = state.extra;
            final productToEdit = extra is ProductEntity ? extra : null;
            final prefilledBarcode = extra is String
                ? extra
                : productToEdit?.barcode;
            final prefilledExpirationDate =
                productToEdit?.expirationDate == null
                ? null
                : DateFormat(
                    'dd-MM-yyyy',
                  ).format(productToEdit!.expirationDate!);
            return AddProductManuallyScreen(
              isEditing: productToEdit != null,
              prefilledName: productToEdit?.name,
              prefilledBarcode: prefilledBarcode,
              prefilledBrand: productToEdit?.brand,
              prefilledQuantity: productToEdit?.quantity,
              prefilledImageUrl: productToEdit?.imageUrl,
              prefilledCategories: productToEdit?.categories,
              prefilledIngredients: productToEdit?.ingredients,
              prefilledAllergens: productToEdit?.allergens,
              prefilledCalories: productToEdit?.nutrition.calories,
              prefilledFat: productToEdit?.nutrition.fat,
              prefilledCarbs: productToEdit?.nutrition.carbs,
              prefilledProtein: productToEdit?.nutrition.protein,
              prefilledExpirationDate: prefilledExpirationDate,
            );
          },
        ),
        GoRoute(
          path: 'scanning-page',
          name: RouteNames.scanningPage,
          builder: (context, state) => const ScanningPage(),
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
    GoRoute(
      path: '/recipes-page',
      name: RouteNames.recipesPage,
      builder: (context, state) => const RecipesPage(),
      routes: [
        GoRoute(
          path: 'recipe-details-page/:recipeId',
          name: RouteNames.recipeDetailsPage,
          builder: (context, state) {
            final recipeIdString = state.pathParameters['recipeId']!;
            final recipeId = int.parse(recipeIdString);
            return BlocProvider(
              create: (context) => RecipeDetailCubit(
                recipeRepository: serviceLocator<RecipeRepository>(),
                recipeId: recipeId,
              )..loadRecipeDetails(),
              child: const RecipeDetailsScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
