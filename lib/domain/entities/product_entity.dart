import 'package:equatable/equatable.dart';
import 'package:smart_kitchen/domain/entities/nutrition_entity.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.barcode,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.quantity,
    required this.categories,
    required this.ingredients,
    required this.allergens,
    required this.nutrition,
  });

  final String barcode;
  final String name;
  final String brand;
  final String imageUrl;
  final String quantity;
  final String categories;
  final String ingredients;
  final String allergens;
  final NutritionEntity nutrition;

  @override
  List<Object?> get props => [
    barcode,
    name,
    brand,
    imageUrl,
    quantity,
    categories,
    ingredients,
    allergens,
    nutrition,
  ];
}
