import 'package:smart_kitchen/core/database/app_database.dart';

abstract interface class RecipeLocalDataSource {
  Future<List<FavoriteRecipe>> getFavoriteRecipesFromDb();

  Future<FavoriteRecipe?> getFavoriteRecipeFromDb({required int id});

  Stream<bool> isRecipeFavoriteInDb({required int id});

  Future<void> saveFavoriteRecipeToDb({
    required FavoriteRecipesCompanion recipe,
  });

  Future<void> deleteFavoriteRecipeFromDb({required int id});
}
