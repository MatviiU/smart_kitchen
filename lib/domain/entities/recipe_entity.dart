import 'package:equatable/equatable.dart';
import 'package:smart_kitchen/domain/entities/ingredient_entity.dart';

class RecipeEntity extends Equatable {
  const RecipeEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.readyInMinutes,
    required this.servings,
    required this.summary,
    required this.instructions,
    required this.steps,
    required this.ingredients,
  });

  factory RecipeEntity.empty() => const RecipeEntity(
    id: 0,
    title: '',
    imageUrl: '',
    readyInMinutes: 0,
    servings: 0,
    summary: '',
    instructions: '',
    steps: [],
    ingredients: [],
  );

  final int id;
  final String title;
  final String imageUrl;
  final int readyInMinutes;
  final int servings;
  final String summary;
  final String instructions;
  final List<String> steps;
  final List<IngredientEntity> ingredients;

  @override
  List<Object?> get props => [
    id,
    title,
    imageUrl,
    readyInMinutes,
    servings,
    summary,
    instructions,
    steps,
    ingredients,
  ];
}
