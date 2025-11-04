import 'package:equatable/equatable.dart';
import 'package:smart_kitchen/domain/entities/recipe_entity.dart';

sealed class RecipeDetailState extends Equatable {
  const RecipeDetailState();

  @override
  List<Object> get props => [];
}

final class RecipeDetailInitial extends RecipeDetailState {}

final class RecipeDetailLoading extends RecipeDetailState {}

final class RecipeDetailLoaded extends RecipeDetailState {
  const RecipeDetailLoaded({required this.recipe, required this.isFavorite});

  final RecipeEntity recipe;
  final bool isFavorite;

  @override
  List<Object> get props => [recipe, isFavorite];

  RecipeDetailLoaded copyWith({RecipeEntity? recipe, bool? isFavorite}) {
    return RecipeDetailLoaded(
      recipe: recipe ?? this.recipe,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

final class RecipeDetailError extends RecipeDetailState {
  const RecipeDetailError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
