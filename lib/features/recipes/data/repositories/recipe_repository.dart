import 'package:smart_kitchen/domain/entities/recipe_entity.dart';
import 'package:smart_kitchen/domain/entities/recipe_preview_entity.dart';

abstract interface class RecipeRepository {
  Future<List<RecipePreviewEntity>> searchRecipesByName({
    required String query,
  });

  Future<List<RecipePreviewEntity>> findRecipesByMyInventory();

  Future<RecipeEntity> getRecipeDetails({required int recipeId});

  Future<List<RecipeEntity>> getFavoriteRecipes();

  Future<void> toggleFavoriteRecipe({required RecipeEntity recipe});

  Stream<bool> isRecipeFavorite({required int recipeId});
}
