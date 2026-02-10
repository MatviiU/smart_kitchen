// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSearchResponseDto _$RecipeSearchResponseDtoFromJson(
  Map<String, dynamic> json,
) => RecipeSearchResponseDto(
  results: (json['results'] as List<dynamic>?)
      ?.map((e) => RecipePreviewDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  offset: (json['offset'] as num?)?.toInt(),
  number: (json['number'] as num?)?.toInt(),
  totalResults: (json['totalResults'] as num?)?.toInt(),
);
