import 'package:dio/dio.dart';
import 'package:smart_kitchen/core/network/recipe_api.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/recipe_details/recipe_detail_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/search_by_ingredients/recipe_by_ingredient_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/search_by_name/recipe_search_response_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/recipe_remote_data_source.dart';

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  const RecipeRemoteDataSourceImpl({required RecipeApi recipeApi})
    : _recipeApi = recipeApi;

  final RecipeApi _recipeApi;

  @override
  Future<List<RecipeByIngredientDto>> findByIngredients({
    required String ingredients,
  }) async {
    try {
      return await _recipeApi.findByIngredients(ingredients);
    } on DioException catch (e) {
      throw Exception('Failed to find recipes by ingredients: ${e.message}');
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }

  @override
  Future<RecipeDetailDto> getRecipeDetails({required int id}) async {
    try {
      return await _recipeApi.getRecipeDetails(id);
    } on DioException catch (e) {
      throw Exception('Failed to get recipe details: ${e.message}');
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }

  @override
  Future<RecipeSearchResponseDto> searchRecipes({required String query}) async {
    try {
      return await _recipeApi.searchRecipes(query);
    } on DioException catch (e) {
      throw Exception('Failed to search recipes: ${e.message}');
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }
}
