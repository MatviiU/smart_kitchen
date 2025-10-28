import 'package:json_annotation/json_annotation.dart';

part 'nutrition_remote_dto.g.dart';

@JsonSerializable(createToJson: false)
class NutritionRemoteDTO {
  const NutritionRemoteDTO({
    this.carbohydrates,
    this.carbohydrates100G,
    this.carbohydratesUnit,
    this.carbohydratesValue,
    this.energy,
    this.energyKcal,
    this.energyKcal100G,
    this.energyKcalUnit,
    this.energyKcalValue,
    this.energyKcalValueComputed,
    this.energy100G,
    this.energyUnit,
    this.energyValue,
    this.fat,
    this.fat100G,
    this.fatUnit,
    this.fatValue,
    this.fruitsVegetablesLegumesEstimateFromIngredients100G,
    this.fruitsVegetablesLegumesEstimateFromIngredientsServing,
    this.fruitsVegetablesNutsEstimateFromIngredients100G,
    this.fruitsVegetablesNutsEstimateFromIngredientsServing,
    this.novaGroup,
    this.novaGroup100G,
    this.novaGroupServing,
    this.nutritionScoreFr,
    this.nutritionScoreFr100G,
    this.proteins,
    this.proteins100G,
    this.proteinsUnit,
    this.proteinsValue,
    this.salt,
    this.salt100G,
    this.saltUnit,
    this.saltValue,
    this.saturatedFat,
    this.saturatedFat100G,
    this.saturatedFatUnit,
    this.saturatedFatValue,
    this.sodium,
    this.sodium100G,
    this.sodiumUnit,
    this.sodiumValue,
    this.sugars,
    this.sugars100G,
    this.sugarsUnit,
    this.sugarsValue,
  });

  factory NutritionRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$NutritionRemoteDTOFromJson(json);
  @JsonKey(name: 'carbohydrates')
  final double? carbohydrates;

  @JsonKey(name: 'carbohydrates_100g')
  final double? carbohydrates100G;

  @JsonKey(name: 'carbohydrates_unit')
  final String? carbohydratesUnit;

  @JsonKey(name: 'carbohydrates_value')
  final double? carbohydratesValue;

  @JsonKey(name: 'energy')
  final int? energy;

  @JsonKey(name: 'energy-kcal')
  final int? energyKcal;

  @JsonKey(name: 'energy-kcal_100g')
  final int? energyKcal100G;

  @JsonKey(name: 'energy-kcal_unit')
  final String? energyKcalUnit;

  @JsonKey(name: 'energy-kcal_value')
  final int? energyKcalValue;

  @JsonKey(name: 'energy-kcal_value_computed')
  final double? energyKcalValueComputed;

  @JsonKey(name: 'energy_100g')
  final int? energy100G;

  @JsonKey(name: 'energy_unit')
  final String? energyUnit;

  @JsonKey(name: 'energy_value')
  final int? energyValue;

  @JsonKey(name: 'fat')
  final double? fat;

  @JsonKey(name: 'fat_100g')
  final double? fat100G;

  @JsonKey(name: 'fat_unit')
  final String? fatUnit;

  @JsonKey(name: 'fat_value')
  final double? fatValue;

  @JsonKey(name: 'fruits-vegetables-legumes-estimate-from-ingredients_100g')
  final int? fruitsVegetablesLegumesEstimateFromIngredients100G;

  @JsonKey(name: 'fruits-vegetables-legumes-estimate-from-ingredients_serving')
  final int? fruitsVegetablesLegumesEstimateFromIngredientsServing;

  @JsonKey(name: 'fruits-vegetables-nuts-estimate-from-ingredients_100g')
  final double? fruitsVegetablesNutsEstimateFromIngredients100G;

  @JsonKey(name: 'fruits-vegetables-nuts-estimate-from-ingredients_serving')
  final double? fruitsVegetablesNutsEstimateFromIngredientsServing;

  @JsonKey(name: 'nova-group')
  final int? novaGroup;

  @JsonKey(name: 'nova-group_100g')
  final int? novaGroup100G;

  @JsonKey(name: 'nova-group_serving')
  final int? novaGroupServing;

  @JsonKey(name: 'nutrition-score-fr')
  final int? nutritionScoreFr;

  @JsonKey(name: 'nutrition-score-fr_100g')
  final int? nutritionScoreFr100G;

  @JsonKey(name: 'proteins')
  final double? proteins;

  @JsonKey(name: 'proteins_100g')
  final double? proteins100G;

  @JsonKey(name: 'proteins_unit')
  final String? proteinsUnit;

  @JsonKey(name: 'proteins_value')
  final double? proteinsValue;

  @JsonKey(name: 'salt')
  final double? salt;

  @JsonKey(name: 'salt_100g')
  final double? salt100G;

  @JsonKey(name: 'salt_unit')
  final String? saltUnit;

  @JsonKey(name: 'salt_value')
  final double? saltValue;

  @JsonKey(name: 'saturated-fat')
  final double? saturatedFat;

  @JsonKey(name: 'saturated-fat_100g')
  final double? saturatedFat100G;

  @JsonKey(name: 'saturated-fat_unit')
  final String? saturatedFatUnit;

  @JsonKey(name: 'saturated-fat_value')
  final double? saturatedFatValue;

  @JsonKey(name: 'sodium')
  final double? sodium;

  @JsonKey(name: 'sodium_100g')
  final double? sodium100G;

  @JsonKey(name: 'sodium_unit')
  final String? sodiumUnit;

  @JsonKey(name: 'sodium_value')
  final double? sodiumValue;

  @JsonKey(name: 'sugars')
  final double? sugars;

  @JsonKey(name: 'sugars_100g')
  final double? sugars100G;

  @JsonKey(name: 'sugars_unit')
  final String? sugarsUnit;

  @JsonKey(name: 'sugars_value')
  final double? sugarsValue;
}
