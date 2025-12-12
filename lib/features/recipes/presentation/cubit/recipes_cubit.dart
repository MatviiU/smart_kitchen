import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/features/recipes/data/repositories/recipe_repository.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository,
      super(RecipesInitial());

  final RecipeRepository _recipeRepository;


  Future<void> searchByName({required String query}) async {
    if (query.isEmpty) {
      emit(RecipesInitial());
      return;
    }

    emit(RecipesLoading());
    try {
      final recipes = await _recipeRepository.searchRecipesByName(query: query);
      emit(RecipesSearchLoaded(recipes: recipes));
    } catch (e) {
      emit(RecipesError(message: e.toString()));
    }
  }

  Future<void> findFromMyInventory() async {
    emit(RecipesLoading());
    try {
      final recipes = await _recipeRepository.findRecipesByMyInventory();
      emit(RecipesSearchLoaded(recipes: recipes));
    } catch (e) {
      emit(RecipesError(message: e.toString()));
    }
  }

  Future<void> getFavoriteRecipes() async {
    emit(RecipesLoading());
    try {
      final recipes = await _recipeRepository.getFavoriteRecipes();
      emit(RecipesFavoritesLoaded(recipes: recipes));
    } catch (e) {
      emit(RecipesError(message: e.toString()));
    }
  }
}
