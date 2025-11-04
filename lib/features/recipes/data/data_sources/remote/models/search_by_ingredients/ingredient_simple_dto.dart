import 'package:json_annotation/json_annotation.dart';

part 'ingredient_simple_dto.g.dart';

@JsonSerializable(createToJson: false)
class IngredientSimpleDto {
  const IngredientSimpleDto({
    this.id,
    this.amount,
    this.unit,
    this.unitLong,
    this.unitShort,
    this.aisle,
    this.name,
    this.original,
    this.originalName,
    this.meta,
    this.extendedName,
    this.image,
  });

  factory IngredientSimpleDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientSimpleDtoFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'amount')
  final double? amount;
  @JsonKey(name: 'unit')
  final String? unit;
  @JsonKey(name: 'unitLong')
  final String? unitLong;
  @JsonKey(name: 'unitShort')
  final String? unitShort;
  @JsonKey(name: 'aisle')
  final String? aisle;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'original')
  final String? original;
  @JsonKey(name: 'originalName')
  final String? originalName;
  @JsonKey(name: 'meta')
  final List<String>? meta;
  @JsonKey(name: 'extendedName')
  final String? extendedName;
  @JsonKey(name: 'image')
  final String? image;
}
