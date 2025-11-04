import 'package:json_annotation/json_annotation.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/recipe_details/analyzed_instruction_dto.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/recipe_details/extended_ingredient_dto.dart';

part 'recipe_detail_dto.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class RecipeDetailDto {
  const RecipeDetailDto({
    this.id,
    this.title,
    this.image,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.summary,
    this.instructions,
    this.extendedIngredients,
    this.analyzedInstructions,
  });

  factory RecipeDetailDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailDtoFromJson(json);
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'readyInMinutes')
  final int? readyInMinutes;

  @JsonKey(name: 'servings')
  final int? servings;

  @JsonKey(name: 'sourceUrl')
  final String? sourceUrl;

  @JsonKey(name: 'summary')
  final String? summary;

  @JsonKey(name: 'instructions')
  final String? instructions;

  @JsonKey(name: 'extendedIngredients')
  final List<ExtendedIngredientDto>? extendedIngredients;

  @JsonKey(name: 'analyzedInstructions')
  final List<AnalyzedInstructionDto>? analyzedInstructions;
}
