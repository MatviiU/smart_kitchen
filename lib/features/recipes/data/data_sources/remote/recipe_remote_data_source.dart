import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/recipe_details/recipe_detail_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/search_by_ingredients/recipe_by_ingredient_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/search_by_name/recipe_search_response_dto.dart';

abstract interface class RecipeRemoteDataSource {
  Future<RecipeSearchResponseDto> searchRecipes({required String query});

  Future<List<RecipeByIngredientDto>> findByIngredients({
    required String ingredients,
  });

  Future<RecipeDetailDto> getRecipeDetails({required int id});
}
