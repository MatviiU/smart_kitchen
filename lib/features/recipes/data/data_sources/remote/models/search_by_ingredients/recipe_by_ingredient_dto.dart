import 'package:json_annotation/json_annotation.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/search_by_ingredients/ingredient_simple_dto.dart';

part 'recipe_by_ingredient_dto.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class RecipeByIngredientDto {
  const RecipeByIngredientDto({
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.usedIngredientCount,
    this.missedIngredientCount,
    this.missedIngredients,
    this.usedIngredients,
    this.unusedIngredients,
    this.likes,
  });

  factory RecipeByIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeByIngredientDtoFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'imageType')
  final String? imageType;
  @JsonKey(name: 'usedIngredientCount')
  final int? usedIngredientCount;
  @JsonKey(name: 'missedIngredientCount')
  final int? missedIngredientCount;
  @JsonKey(name: 'missedIngredients')
  final List<IngredientSimpleDto>? missedIngredients;
  @JsonKey(name: 'usedIngredients')
  final List<IngredientSimpleDto>? usedIngredients;
  @JsonKey(name: 'unusedIngredients')
  final List<IngredientSimpleDto>? unusedIngredients;
  @JsonKey(name: 'likes')
  final int? likes;
}
