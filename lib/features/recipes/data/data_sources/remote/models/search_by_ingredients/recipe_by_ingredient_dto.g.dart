// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_by_ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeByIngredientDto _$RecipeByIngredientDtoFromJson(
  Map<String, dynamic> json,
) => RecipeByIngredientDto(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  image: json['image'] as String?,
  imageType: json['imageType'] as String?,
  usedIngredientCount: (json['usedIngredientCount'] as num?)?.toInt(),
  missedIngredientCount: (json['missedIngredientCount'] as num?)?.toInt(),
  missedIngredients: (json['missedIngredients'] as List<dynamic>?)
      ?.map((e) => IngredientSimpleDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  usedIngredients: (json['usedIngredients'] as List<dynamic>?)
      ?.map((e) => IngredientSimpleDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  unusedIngredients: (json['unusedIngredients'] as List<dynamic>?)
      ?.map((e) => IngredientSimpleDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  likes: (json['likes'] as num?)?.toInt(),
);
