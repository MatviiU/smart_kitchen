import 'package:equatable/equatable.dart';

class IngredientEntity extends Equatable {
  const IngredientEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.originalDescription,
    required this.amount,
    required this.unit,
  });

  factory IngredientEntity.empty() => const IngredientEntity(
    id: 0,
    name: '',
    imageUrl: '',
    originalDescription: '',
    amount: 0,
    unit: '',
  );

  final int id;
  final String name;
  final String imageUrl;
  final String originalDescription;
  final double amount;
  final String unit;

  @override
  List<Object?> get props => [
    id,
    name,
    imageUrl,
    originalDescription,
    amount,
    unit,
  ];
}
