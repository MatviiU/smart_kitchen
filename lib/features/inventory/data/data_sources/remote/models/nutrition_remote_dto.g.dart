// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_remote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionRemoteDTO _$NutritionRemoteDTOFromJson(
  Map<String, dynamic> json,
) => NutritionRemoteDTO(
  carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
  carbohydrates100G: (json['carbohydrates_100g'] as num?)?.toDouble(),
  carbohydratesUnit: json['carbohydrates_unit'] as String?,
  carbohydratesValue: (json['carbohydrates_value'] as num?)?.toDouble(),
  energy: (json['energy'] as num?)?.toInt(),
  energyKcal: (json['energy-kcal'] as num?)?.toInt(),
  energyKcal100G: (json['energy-kcal_100g'] as num?)?.toInt(),
  energyKcalUnit: json['energy-kcal_unit'] as String?,
  energyKcalValue: (json['energy-kcal_value'] as num?)?.toInt(),
  energyKcalValueComputed: (json['energy-kcal_value_computed'] as num?)
      ?.toDouble(),
  energy100G: (json['energy_100g'] as num?)?.toInt(),
  energyUnit: json['energy_unit'] as String?,
  energyValue: (json['energy_value'] as num?)?.toInt(),
  fat: (json['fat'] as num?)?.toDouble(),
  fat100G: (json['fat_100g'] as num?)?.toDouble(),
  fatUnit: json['fat_unit'] as String?,
  fatValue: (json['fat_value'] as num?)?.toDouble(),
  fruitsVegetablesLegumesEstimateFromIngredients100G:
      (json['fruits-vegetables-legumes-estimate-from-ingredients_100g'] as num?)
          ?.toInt(),
  fruitsVegetablesLegumesEstimateFromIngredientsServing:
      (json['fruits-vegetables-legumes-estimate-from-ingredients_serving']
              as num?)
          ?.toInt(),
  fruitsVegetablesNutsEstimateFromIngredients100G:
      (json['fruits-vegetables-nuts-estimate-from-ingredients_100g'] as num?)
          ?.toDouble(),
  fruitsVegetablesNutsEstimateFromIngredientsServing:
      (json['fruits-vegetables-nuts-estimate-from-ingredients_serving'] as num?)
          ?.toDouble(),
  novaGroup: (json['nova-group'] as num?)?.toInt(),
  novaGroup100G: (json['nova-group_100g'] as num?)?.toInt(),
  novaGroupServing: (json['nova-group_serving'] as num?)?.toInt(),
  nutritionScoreFr: (json['nutrition-score-fr'] as num?)?.toInt(),
  nutritionScoreFr100G: (json['nutrition-score-fr_100g'] as num?)?.toInt(),
  proteins: (json['proteins'] as num?)?.toDouble(),
  proteins100G: (json['proteins_100g'] as num?)?.toDouble(),
  proteinsUnit: json['proteins_unit'] as String?,
  proteinsValue: (json['proteins_value'] as num?)?.toDouble(),
  salt: (json['salt'] as num?)?.toDouble(),
  salt100G: (json['salt_100g'] as num?)?.toDouble(),
  saltUnit: json['salt_unit'] as String?,
  saltValue: (json['salt_value'] as num?)?.toDouble(),
  saturatedFat: (json['saturated-fat'] as num?)?.toDouble(),
  saturatedFat100G: (json['saturated-fat_100g'] as num?)?.toDouble(),
  saturatedFatUnit: json['saturated-fat_unit'] as String?,
  saturatedFatValue: (json['saturated-fat_value'] as num?)?.toDouble(),
  sodium: (json['sodium'] as num?)?.toDouble(),
  sodium100G: (json['sodium_100g'] as num?)?.toDouble(),
  sodiumUnit: json['sodium_unit'] as String?,
  sodiumValue: (json['sodium_value'] as num?)?.toDouble(),
  sugars: (json['sugars'] as num?)?.toDouble(),
  sugars100G: (json['sugars_100g'] as num?)?.toDouble(),
  sugarsUnit: json['sugars_unit'] as String?,
  sugarsValue: (json['sugars_value'] as num?)?.toDouble(),
);
