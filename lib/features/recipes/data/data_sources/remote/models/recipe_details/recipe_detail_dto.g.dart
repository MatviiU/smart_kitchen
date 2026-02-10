// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDetailDto _$RecipeDetailDtoFromJson(
  Map<String, dynamic> json,
) => RecipeDetailDto(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  image: json['image'] as String?,
  readyInMinutes: (json['readyInMinutes'] as num?)?.toInt(),
  servings: (json['servings'] as num?)?.toInt(),
  sourceUrl: json['sourceUrl'] as String?,
  summary: json['summary'] as String?,
  instructions: json['instructions'] as String?,
  extendedIngredients: (json['extendedIngredients'] as List<dynamic>?)
      ?.map((e) => ExtendedIngredientDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  analyzedInstructions: (json['analyzedInstructions'] as List<dynamic>?)
      ?.map((e) => AnalyzedInstructionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);
