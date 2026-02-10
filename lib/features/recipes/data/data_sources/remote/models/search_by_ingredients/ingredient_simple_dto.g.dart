// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_simple_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientSimpleDto _$IngredientSimpleDtoFromJson(Map<String, dynamic> json) =>
    IngredientSimpleDto(
      id: (json['id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      unitLong: json['unitLong'] as String?,
      unitShort: json['unitShort'] as String?,
      aisle: json['aisle'] as String?,
      name: json['name'] as String?,
      original: json['original'] as String?,
      originalName: json['originalName'] as String?,
      meta: (json['meta'] as List<dynamic>?)?.map((e) => e as String).toList(),
      extendedName: json['extendedName'] as String?,
      image: json['image'] as String?,
    );
