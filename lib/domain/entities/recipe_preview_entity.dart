import 'package:equatable/equatable.dart';

class RecipePreviewEntity extends Equatable {
  const RecipePreviewEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.missedIngredientCount,
  });

  final int id;
  final String title;
  final String imageUrl;

  final int? missedIngredientCount;

  @override
  List<Object?> get props => [id, title, imageUrl, missedIngredientCount];
}
