import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:smart_kitchen/core/database/app_database.dart';
import 'package:smart_kitchen/domain/entities/ingredient_entity.dart';
import 'package:smart_kitchen/domain/entities/recipe_entity.dart';
import 'package:smart_kitchen/domain/entities/recipe_preview_entity.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/recipe_details/analyzed_instruction_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/recipe_details/extended_ingredient_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/recipe_details/recipe_detail_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/search_by_ingredients/recipe_by_ingredient_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/search_by_name/recipe_search_response_dto.dart';

class RecipeMapper {
  static List<RecipePreviewEntity> mapRemoteSearchToPreviewList(
    RecipeSearchResponseDto dto,
  ) {
    if (dto.results == null || dto.results!.isEmpty) {
      return [];
    }
    return dto.results!
        .where((previewDto) => previewDto.id != null)
        .map(
          (previewDto) => RecipePreviewEntity(
            id: previewDto.id!,
            title: previewDto.title ?? 'Unknown Title',
            imageUrl: previewDto.image ?? '',
            missedIngredientCount: null,
            isFavorite: false,
          ),
        )
        .toList();
  }

  static List<RecipePreviewEntity> mapRemoteByIngredientsToPreviewList(
    List<RecipeByIngredientDto> dtoList,
  ) {
    return dtoList
        .where((recipeDto) => recipeDto.id != null)
        .map(
          (recipeDto) => RecipePreviewEntity(
            id: recipeDto.id!,
            title: recipeDto.title ?? 'Unknown Title',
            imageUrl: recipeDto.image ?? '',
            missedIngredientCount: recipeDto.missedIngredientCount ?? 0,
            isFavorite: false,
          ),
        )
        .toList();
  }

  static RecipePreviewEntity mapEntityToPreview(RecipeEntity entity) {
    return RecipePreviewEntity(
      id: entity.id,
      title: entity.title,
      imageUrl: entity.imageUrl,
      missedIngredientCount: null,
      isFavorite: true,
    );
  }

  static RecipeEntity mapRemoteDetailToEntity(RecipeDetailDto dto) {
    return RecipeEntity(
      id: dto.id ?? 0,
      title: dto.title ?? 'Unknown Title',
      imageUrl: dto.image ?? '',
      readyInMinutes: dto.readyInMinutes ?? 0,
      servings: dto.servings ?? 0,
      summary: dto.summary ?? '',
      instructions: dto.instructions ?? '',
      ingredients:
          dto.extendedIngredients
              ?.map(_mapExtendedIngredientToEntity)
              .toList() ??
          [],
      steps: _mapAnalyzedInstructionsToSteps(dto.analyzedInstructions),
    );
  }

  static FavoriteRecipesCompanion mapEntityToDbCompanion(RecipeEntity entity) {
    final ingredientsJson = entity.ingredients
        .map(
          (ing) => {
            'id': ing.id,
            'name': ing.name,
            'imageUrl': ing.imageUrl,
            'originalDescription': ing.originalDescription,
            'amount': ing.amount,
            'unit': ing.unit,
          },
        )
        .toList();
    return FavoriteRecipesCompanion(
      id: Value(entity.id),
      title: Value(entity.title),
      image: Value(entity.imageUrl),
      readyInMinutes: Value(entity.readyInMinutes),
      servings: Value(entity.servings),
      summary: Value(entity.summary),
      instructions: Value(entity.instructions),
      extendedIngredientsJson: Value(jsonEncode(ingredientsJson)),
      analyzedInstructionsJson: Value(jsonEncode(entity.steps)),
    );
  }

  static RecipeEntity mapDbDataToEntity(FavoriteRecipe dbRecipe) {
    var ingredients = <IngredientEntity>[];

    if (dbRecipe.extendedIngredientsJson != null) {
      final decodedList =
          jsonDecode(dbRecipe.extendedIngredientsJson!) as List<dynamic>;
      ingredients = decodedList
          .map(
            (jsonMap) => IngredientEntity(
              id: (jsonMap['id'] as int?) ?? 0,
              name: (jsonMap['name'] as String?) ?? '',
              imageUrl: (jsonMap['imageUrl'] as String?) ?? '',
              originalDescription:
                  (jsonMap['originalDescription'] as String?) ?? '',
              amount: (jsonMap['amount'] as num?)?.toDouble() ?? 0.0,
              unit: (jsonMap['unit'] as String?) ?? '',
            ),
          )
          .toList();
    }
    var steps = <String>[];
    if (dbRecipe.analyzedInstructionsJson != null) {
      final decodedList =
          jsonDecode(dbRecipe.analyzedInstructionsJson!) as List<dynamic>;
      steps = decodedList.map((step) => step.toString()).toList();
    }

    return RecipeEntity(
      id: dbRecipe.id,
      title: dbRecipe.title,
      imageUrl: dbRecipe.image ?? '',
      readyInMinutes: dbRecipe.readyInMinutes ?? 0,
      servings: dbRecipe.servings ?? 0,
      summary: dbRecipe.summary ?? '',
      instructions: dbRecipe.instructions ?? '',
      ingredients: ingredients,
      steps: steps,
    );
  }

  static IngredientEntity _mapExtendedIngredientToEntity(
    ExtendedIngredientDto dto,
  ) {
    return IngredientEntity(
      id: dto.id ?? 0,
      name: dto.name ?? 'Unknown Ingredient',
      imageUrl: dto.image ?? '',
      originalDescription: dto.original ?? '',
      amount: dto.amount ?? 0.0,
      unit: dto.unit ?? '',
    );
  }

  static List<String> _mapAnalyzedInstructionsToSteps(
    List<AnalyzedInstructionDto>? instructions,
  ) {
    if (instructions == null || instructions.isEmpty) {
      return [];
    }
    final allSteps = <String>[];
    for (final instructionSet in instructions) {
      if (instructionSet.steps != null) {
        for (final step in instructionSet.steps!) {
          if (step.step != null) {
            allSteps.add(step.step!);
          }
        }
      }
    }
    return allSteps;
  }
}
