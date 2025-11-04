import 'package:json_annotation/json_annotation.dart';

part 'recipe_preview_dto.g.dart';
@JsonSerializable(createToJson: false)
class RecipePreviewDto {
  const RecipePreviewDto({this.id, this.title, this.image, this.imageType});

  factory RecipePreviewDto.fromJson(Map<String, dynamic> json) =>
      _$RecipePreviewDtoFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'imageType')
  final String? imageType;
}
