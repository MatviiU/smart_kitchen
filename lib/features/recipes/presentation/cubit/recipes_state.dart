import 'package:equatable/equatable.dart';
import 'package:smart_kitchen/domain/entities/recipe_preview_entity.dart';

enum RecipesFilter { fromMyIngredients, favorites }

sealed class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object> get props => [];
}

final class RecipesInitial extends RecipesState {}

final class RecipesLoading extends RecipesState {}

final class RecipesLoaded extends RecipesState {
  const RecipesLoaded({
    required this.recipes,
    required this.allRecipes,
    this.filter = RecipesFilter.fromMyIngredients,
  });

  final List<RecipePreviewEntity> recipes;
  final List<RecipePreviewEntity> allRecipes;
  final RecipesFilter filter;

  RecipesLoaded copyWith({
    List<RecipePreviewEntity>? recipes,
    List<RecipePreviewEntity>? allRecipes,
    RecipesFilter? filter,
  }) {
    return RecipesLoaded(
      recipes: recipes ?? this.recipes,
      allRecipes: allRecipes ?? this.allRecipes,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [recipes, allRecipes, filter];
}

final class RecipesError extends RecipesState {
  const RecipesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
