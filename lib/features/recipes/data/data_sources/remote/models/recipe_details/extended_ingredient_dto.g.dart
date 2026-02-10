// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extended_ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendedIngredientDto _$ExtendedIngredientDtoFromJson(
  Map<String, dynamic> json,
) => ExtendedIngredientDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  unit: json['unit'] as String?,
  original: json['original'] as String?,
  image: json['image'] as String?,
);
