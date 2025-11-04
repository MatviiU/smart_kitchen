import 'package:smart_kitchen/core/database/app_database.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/local/recipe_local_data_source.dart';

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  const RecipeLocalDataSourceImpl({required AppDatabase database})
    : _database = database;

  final AppDatabase _database;

  @override
  Future<void> deleteFavoriteRecipeFromDb({required int id}) async {
    await _database.deleteFavoriteRecipeFromDb(id: id);
  }

  @override
  Future<FavoriteRecipe?> getFavoriteRecipeFromDb({required int id}) async {
    final favoriteRecipe = await _database.getFavoriteRecipeFromDb(id: id);
    return favoriteRecipe;
  }

  @override
  Future<List<FavoriteRecipe>> getFavoriteRecipesFromDb() async {
    final favoriteRecipes = await _database.getAllFavoriteRecipesFromDb();
    return favoriteRecipes;
  }

  @override
  Stream<bool> isRecipeFavoriteInDb({required int id}) async* {
    yield* _database.isRecipeFavoriteInDb(id: id);
  }

  @override
  Future<void> saveFavoriteRecipeToDb({
    required FavoriteRecipesCompanion recipe,
  }) async {
    await _database.saveFavoriteRecipeToDb(recipe: recipe);
  }
}
