import 'package:equatable/equatable.dart';
import 'package:smart_kitchen/domain/entities/recipe_entity.dart';
import 'package:smart_kitchen/domain/entities/recipe_preview_entity.dart';

sealed class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object> get props => [];
}

final class RecipesInitial extends RecipesState {}

final class RecipesLoading extends RecipesState {}

final class RecipesSearchLoaded extends RecipesState {
  const RecipesSearchLoaded({required this.recipes});

  final List<RecipePreviewEntity> recipes;

  @override
  List<Object> get props => [recipes];
}

final class RecipesFavoritesLoaded extends RecipesState {
  const RecipesFavoritesLoaded({required this.recipes});

  final List<RecipeEntity> recipes;

  @override
  List<Object> get props => [recipes];
}

final class RecipesError extends RecipesState {
  const RecipesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
