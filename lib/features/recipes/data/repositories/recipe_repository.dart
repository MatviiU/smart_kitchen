import 'package:smart_kitchen/domain/entities/recipe_entity.dart';
import 'package:smart_kitchen/domain/entities/recipe_preview_entity.dart';

abstract interface class RecipeRepository {
  /// Шукає рецепти за назвою (напр., "pasta")
  Future<List<RecipePreviewEntity>> searchRecipesByName({
    required String query,
  });

  /// Шукає рецепти на основі інвентарю користувача
  Future<List<RecipePreviewEntity>> findRecipesByMyInventory();

  /// Отримує повні деталі одного рецепту
  Future<RecipeEntity> getRecipeDetails({required int recipeId});

  /// Отримує список усіх улюблених рецептів (збережених локально)
  Future<List<RecipeEntity>> getFavoriteRecipes();

  /// Перемикає статус "улюблене" для рецепту (зберігає або видаляє)
  Future<void> toggleFavoriteRecipe({required RecipeEntity recipe});

  /// Слідкує (watch) за статусом "улюблене" для одного рецепту
  Stream<bool> isRecipeFavorite({required int recipeId});
}
