import 'package:json_annotation/json_annotation.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/search_by_name/recipe_preview_dto.dart';

part 'recipe_search_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class RecipeSearchResponseDto {
  const RecipeSearchResponseDto({
    this.results,
    this.offset,
    this.number,
    this.totalResults,
  });

  factory RecipeSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeSearchResponseDtoFromJson(json);

  @JsonKey(name: 'results')
  final List<RecipePreviewDto>? results;
  @JsonKey(name: 'offset')
  final int? offset;
  @JsonKey(name: 'number')
  final int? number;
  @JsonKey(name: 'totalResults')
  final int? totalResults;
}
