import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_kitchen/core/navigation/route_names.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipes_cubit.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipes_state.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/favorites_empty_widget.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/filter_selector_view_only.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/recipe_card.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/search_bar.dart';
import 'package:smart_kitchen/features/recipes/presentation/ui/widgets/section_title.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  late final SearchController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = SearchController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
        title: const Text(
          'Recipes',
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: -0.015),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            CustomSearchBar(searchController: _searchController),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FilterSelectorViewOnly(
                selectedFilter: switch (context.watch<RecipesCubit>().state) {
                  RecipesLoaded(filter: final filter) => filter,
                  _ => RecipesFilter.fromMyIngredients,
                },
                onChanged: (filter) {
                  context.read<RecipesCubit>().setFilter(filter: filter);
                },
              ),
            ),
            const SizedBox(height: 8),
            BlocBuilder<RecipesCubit, RecipesState>(
              builder: (context, state) {
                return switch (state) {
                  RecipesInitial() => const Expanded(
                    child: Center(
                      child: Text(
                        'Введіть назву рецепта або відкрийте підбірку',
                      ),
                    ),
                  ),
                  RecipesLoading() => const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  RecipesLoaded(recipes: final recipes, filter: final filter) =>
                    Expanded(
                      child: recipes.isEmpty
                          ? filter == RecipesFilter.favorites
                                ? const FavoritesEmptyWidget()
                                : const Center(
                                    child: Text(
                                      'No recipes found for your ingredients',
                                    ),
                                  )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  child: SectionTitle(
                                    title: filter == RecipesFilter.favorites
                                        ? 'Favorite Recipes'
                                        : 'Smart Suggestions',
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(bottom: 24),
                                    itemCount: math.min(5, recipes.length),
                                    itemBuilder: (context, index) {
                                      final recipe = recipes[index];
                                      final meta =
                                          recipe.missedIngredientCount == null
                                          ? 'Saved recipe'
                                          : 'Missing ingredients';
                                      return RecipeCard(
                                        title: recipe.title,
                                        meta: meta,
                                        imageUrl: recipe.imageUrl,
                                        isFavorite: recipe.isFavorite,
                                        onTap: () {
                                          context.pushNamed(
                                            RouteNames.recipeDetailsPage,
                                            pathParameters: {
                                              'recipeId': recipe.id.toString(),
                                            },
                                          );
                                        },
                                        onFavoriteTap: () {
                                          context
                                              .read<RecipesCubit>()
                                              .toggleFavorite(
                                                recipeId: recipe.id,
                                              );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                    ),
                  RecipesError() => Expanded(
                    child: Center(child: Text(state.message)),
                  ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
