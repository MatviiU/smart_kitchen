import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/recipe_details/recipe_detail_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/search_by_ingredients/recipe_by_ingredient_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/search_by_name/recipe_search_response_dto.dart';

part 'recipe_api.g.dart';

@RestApi()
abstract class RecipeApi {
  factory RecipeApi(Dio dio, {String baseUrl}) = _RecipeApi;

  @GET('/complexSearch')
  Future<RecipeSearchResponseDto> searchRecipes(
    @Query('query') String query, {
    @Query('number') int number = 10,
    @Query('offset') int offset = 0,
  });

  @GET('/findByIngredients')
  Future<List<RecipeByIngredientDto>> findByIngredients(
    @Query('ingredients') String ingredients, {
    @Query('ranking') int ranking = 1,
  });

  @GET('/{id}/information')
  Future<RecipeDetailDto> getRecipeDetails(
    @Path('id') int recipeId, {
    @Query('includeNutrition') bool includeNutrition = false,
  });
}
