import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/domain/entities/recipe_preview_entity.dart';
import 'package:smart_kitchen/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:smart_kitchen/features/recipes/data/repositories/recipe_repository.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository,
      super(RecipesInitial());

  final RecipeRepository _recipeRepository;
  List<RecipePreviewEntity> _cachedFromInventoryRecipes = [];

  Future<void> searchByName({required String query}) async {
    if (query.isEmpty) {
      final currentState = state;
      if (currentState is RecipesLoaded &&
          currentState.filter == RecipesFilter.favorites) {
        await loadFavoriteRecipes();
        return;
      }
      await findFromMyInventory();
      return;
    }

    emit(RecipesLoading());
    try {
      final recipes = await _recipeRepository.searchRecipesByName(query: query);
      _cachedFromInventoryRecipes = recipes;
      emit(
        RecipesLoaded(
          recipes: recipes,
          allRecipes: recipes,
          filter: RecipesFilter.fromMyIngredients,
        ),
      );
    } catch (e) {
      emit(RecipesError(message: e.toString()));
    }
  }

  Future<void> findFromMyInventory() async {
    emit(RecipesLoading());
    try {
      final recipes = await _recipeRepository.findRecipesByMyInventory();
      _cachedFromInventoryRecipes = recipes;
      emit(
        RecipesLoaded(
          recipes: recipes,
          allRecipes: recipes,
          filter: RecipesFilter.fromMyIngredients,
        ),
      );
    } catch (e) {
      emit(RecipesError(message: e.toString()));
    }
  }

  Future<void> loadFavoriteRecipes() async {
    emit(RecipesLoading());
    try {
      final favoriteRecipes = await _recipeRepository.getFavoriteRecipes();
      final previews = favoriteRecipes
          .map(RecipeMapper.mapEntityToPreview)
          .toList();
      emit(
        RecipesLoaded(
          recipes: previews,
          allRecipes: previews,
          filter: RecipesFilter.favorites,
        ),
      );
    } catch (e) {
      emit(RecipesError(message: e.toString()));
    }
  }

  Future<void> toggleFavorite({required int recipeId}) async {
    final currentState = state;
    if (currentState is! RecipesLoaded) {
      return;
    }

    try {
      final fullRecipe = await _recipeRepository.getRecipeDetails(
        recipeId: recipeId,
      );
      await _recipeRepository.toggleFavoriteRecipe(recipe: fullRecipe);

      if (currentState.filter == RecipesFilter.favorites) {
        await loadFavoriteRecipes();
        return;
      }

      final updatedRecipes = currentState.recipes.map((recipe) {
        if (recipe.id == recipeId) {
          return recipe.copyWith(isFavorite: !recipe.isFavorite);
        }
        return recipe;
      }).toList();

      final updatedAllRecipes = currentState.allRecipes.map((recipe) {
        if (recipe.id == recipeId) {
          return recipe.copyWith(isFavorite: !recipe.isFavorite);
        }
        return recipe;
      }).toList();

      _cachedFromInventoryRecipes = updatedAllRecipes;
      emit(
        currentState.copyWith(
          recipes: updatedRecipes,
          allRecipes: updatedAllRecipes,
        ),
      );
    } catch (e) {
      emit(RecipesError(message: e.toString()));
    }
  }

  Future<void> setFilter({required RecipesFilter filter}) async {
    final currentState = state;
    if (filter == RecipesFilter.favorites) {
      await loadFavoriteRecipes();
      return;
    }

    if (_cachedFromInventoryRecipes.isNotEmpty) {
      emit(
        RecipesLoaded(
          recipes: _cachedFromInventoryRecipes,
          allRecipes: _cachedFromInventoryRecipes,
          filter: RecipesFilter.fromMyIngredients,
        ),
      );
      return;
    }

    if (currentState is RecipesLoaded &&
        currentState.filter == RecipesFilter.fromMyIngredients) {
      emit(currentState.copyWith(filter: RecipesFilter.fromMyIngredients));
      return;
    }

    await findFromMyInventory();
  }
}
