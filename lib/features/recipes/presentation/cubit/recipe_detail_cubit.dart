import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/features/recipes/data/repositories/recipe_repository.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipe_detail_state.dart';

class RecipeDetailCubit extends Cubit<RecipeDetailState> {
  RecipeDetailCubit({
    required RecipeRepository recipeRepository,
    required int recipeId,
  }) : _recipeRepository = recipeRepository,
       _recipeId = recipeId,
       super(RecipeDetailInitial());

  final RecipeRepository _recipeRepository;
  final int _recipeId;
  StreamSubscription<bool>? _favoriteSubscription;

  Future<void> loadRecipeDetails() async {
    emit(RecipeDetailLoading());
    try {
      final recipe = await _recipeRepository.getRecipeDetails(
        recipeId: _recipeId,
      );
      await _favoriteSubscription?.cancel();
      _favoriteSubscription = _recipeRepository
          .isRecipeFavorite(recipeId: _recipeId)
          .listen((isFavorite) {
            emit(RecipeDetailLoaded(recipe: recipe, isFavorite: isFavorite));
          });
    } catch (e) {
      emit(RecipeDetailError(message: e.toString()));
    }
  }

  Future<void> toggleFavorite() async {
    if (state is! RecipeDetailLoaded) return;
    final currentRecipe = (state as RecipeDetailLoaded).recipe;
    try {
      await _recipeRepository.toggleFavoriteRecipe(recipe: currentRecipe);
    } catch (e) {
      emit(RecipeDetailError(message: 'Failed to update favorite: $e'));
    }
  }

  @override
  Future<void> close() {
    _favoriteSubscription?.cancel();
    return super.close();
  }
}
