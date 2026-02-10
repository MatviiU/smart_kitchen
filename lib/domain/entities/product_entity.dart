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
    this.isFavorite = false,
    this.expirationDate,
  });

  factory ProductEntity.fromForm({
    required String barcode,
    required String name,
    required String brand,
    required String quantity,
    String imageUrl = '',
    String categories = '',
    String ingredients = '',
    String allergens = '',
    NutritionEntity? nutrition,
    DateTime? expirationDate,
  }) {
    return ProductEntity(
      barcode: barcode,
      name: name,
      brand: brand,
      imageUrl: imageUrl,
      quantity: quantity,
      categories: categories,
      ingredients: ingredients,
      allergens: allergens,
      nutrition: nutrition ?? NutritionEntity.empty(),
      expirationDate: expirationDate,
    );
  }

  final String barcode;
  final String name;
  final String brand;
  final String imageUrl;
  final String quantity;
  final String categories;
  final String ingredients;
  final String allergens;
  final bool isFavorite;
  final NutritionEntity nutrition;
  final DateTime? expirationDate;

  ProductEntity copyWith({
    String? barcode,
    String? name,
    String? brand,
    String? imageUrl,
    String? quantity,
    String? categories,
    String? ingredients,
    String? allergens,
    bool? isFavorite,
    NutritionEntity? nutrition,
    DateTime? expirationDate,
  }) {
    return ProductEntity(
      barcode: barcode ?? this.barcode,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      categories: categories ?? this.categories,
      ingredients: ingredients ?? this.ingredients,
      allergens: allergens ?? this.allergens,
      isFavorite: isFavorite ?? this.isFavorite,
      nutrition: nutrition ?? this.nutrition,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }

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
    isFavorite,
    nutrition,
    expirationDate,
  ];
}
