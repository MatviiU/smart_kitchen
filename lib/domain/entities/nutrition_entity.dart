import 'package:equatable/equatable.dart';

class NutritionEntity extends Equatable {
  const NutritionEntity({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
  });

  factory NutritionEntity.empty() =>
      const NutritionEntity(calories: 0, protein: 0, fat: 0, carbs: 0);

  final double calories;
  final double protein;
  final double fat;
  final double carbs;

  @override
  List<Object?> get props => [calories, protein, fat, carbs];
}
