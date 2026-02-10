import 'package:equatable/equatable.dart';

class RecipePreviewEntity extends Equatable {
  const RecipePreviewEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.missedIngredientCount,
    this.isFavorite = false,
  });

  final int id;
  final String title;
  final String imageUrl;

  final int? missedIngredientCount;
  final bool isFavorite;

  RecipePreviewEntity copyWith({
    int? id,
    String? title,
    String? imageUrl,
    int? missedIngredientCount,
    bool? isFavorite,
  }) {
    return RecipePreviewEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      missedIngredientCount:
          missedIngredientCount ?? this.missedIngredientCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    imageUrl,
    missedIngredientCount,
    isFavorite,
  ];
}
