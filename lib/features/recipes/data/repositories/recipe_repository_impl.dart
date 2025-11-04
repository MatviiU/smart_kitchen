import 'package:smart_kitchen/domain/entities/recipe_entity.dart';
import 'package:smart_kitchen/domain/entities/recipe_preview_entity.dart';
import 'package:smart_kitchen/features/inventory/data/repositories/inventory_repository.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/local/recipe_local_data_source.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/recipe_remote_data_source.dart';
import 'package:smart_kitchen/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:smart_kitchen/features/recipes/data/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  const RecipeRepositoryImpl({
    required RecipeRemoteDataSource remoteDataSource,
    required RecipeLocalDataSource localDataSource,
    required InventoryRepository inventoryRepository,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource,
       _inventoryRepository = inventoryRepository;

  final RecipeRemoteDataSource _remoteDataSource;
  final RecipeLocalDataSource _localDataSource;
  final InventoryRepository _inventoryRepository;

  @override
  Future<List<RecipePreviewEntity>> findRecipesByMyInventory() async {
    try {
      final inventoryProducts = await _inventoryRepository.getAllProducts();
      if (inventoryProducts.isEmpty) {
        return [];
      }

      final ingredientsQuery = inventoryProducts
          .map((product) => product.name)
          .join(',+');
      final dtoList = await _remoteDataSource.findByIngredients(
        ingredients: ingredientsQuery,
      );
      return RecipeMapper.mapRemoteByIngredientsToPreviewList(dtoList);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeEntity>> getFavoriteRecipes() async {
    final dbFavorites = await _localDataSource.getFavoriteRecipesFromDb();
    return dbFavorites.map(RecipeMapper.mapDbDataToEntity).toList();
  }

  @override
  Future<RecipeEntity> getRecipeDetails({required int recipeId}) async {
    try {
      final favoriteRecipe = await _localDataSource.getFavoriteRecipeFromDb(
        id: recipeId,
      );
      if (favoriteRecipe != null) {
        return RecipeMapper.mapDbDataToEntity(favoriteRecipe);
      }
      final detailDto = await _remoteDataSource.getRecipeDetails(id: recipeId);
      return RecipeMapper.mapRemoteDetailToEntity(detailDto);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<bool> isRecipeFavorite({required int recipeId}) async* {
    yield* _localDataSource.isRecipeFavoriteInDb(id: recipeId);
  }

  @override
  Future<List<RecipePreviewEntity>> searchRecipesByName({
    required String query,
  }) async {
    try {
      final searchResultDto = await _remoteDataSource.searchRecipes(
        query: query,
      );
      return RecipeMapper.mapRemoteSearchToPreviewList(searchResultDto);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> toggleFavoriteRecipe({required RecipeEntity recipe}) async {
    final isFavorite = await _localDataSource.getFavoriteRecipeFromDb(
      id: recipe.id,
    );
    if (isFavorite != null) {
      await _localDataSource.deleteFavoriteRecipeFromDb(id: recipe.id);
    } else {
      final dbCompanion = RecipeMapper.mapEntityToDbCompanion(recipe);
      await _localDataSource.saveFavoriteRecipeToDb(recipe: dbCompanion);
    }
  }
}
