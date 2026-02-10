import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipes_cubit.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipes_state.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({required this.searchController, super.key});

  final SearchController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: SearchAnchor.bar(
              barHintText: 'Search for recipes',
              barElevation: const WidgetStatePropertyAll(0),
              barLeading: const Icon(Icons.search),
              viewElevation: 0,
              searchController: searchController,
              onChanged: (query) {
                context.read<RecipesCubit>().searchByName(query: query);
              },
              suggestionsBuilder: (context, controller) {
                context.read<RecipesCubit>().searchByName(
                  query: controller.text,
                );
                return [
                  BlocBuilder<RecipesCubit, RecipesState>(
                    builder: (context, state) {
                      return switch (state) {
                        RecipesInitial() => const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Почніть вводити назву рецепта'),
                        ),
                        RecipesLoading() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        RecipesLoaded(recipes: final results) =>
                          results.isEmpty
                              ? Padding(
                                  padding: const .all(16),
                                  child: Text(
                                    'No recipes found for "${controller.text}"',
                                  ),
                                )
                              : Column(
                                  children: results
                                      .map(
                                        (recipe) => ListTile(
                                          titleAlignment: .center,
                                          title: Text(recipe.title),
                                          onTap: () {
                                            controller.closeView(recipe.title);
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                        RecipesError() => Center(child: Text(state.message)),
                      };
                    },
                  ),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }
}
