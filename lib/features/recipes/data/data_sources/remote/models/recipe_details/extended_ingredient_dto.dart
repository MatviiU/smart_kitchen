import 'package:json_annotation/json_annotation.dart';

part 'extended_ingredient_dto.g.dart';

@JsonSerializable(createToJson: false)
class ExtendedIngredientDto {
  const ExtendedIngredientDto({
    this.id,
    this.name,
    this.amount,
    this.unit,
    this.original,
    this.image,
  });

  factory ExtendedIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$ExtendedIngredientDtoFromJson(json);

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'amount')
  final double? amount;

  @JsonKey(name: 'unit')
  final String? unit;

  @JsonKey(name: 'original')
  final String? original;

  @JsonKey(name: 'image')
  final String? image;
}
