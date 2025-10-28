import 'package:equatable/equatable.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';

sealed class InventoryState extends Equatable {
  const InventoryState();

  @override
  List<Object> get props => [];
}

final class InventoryInitial extends InventoryState {}

final class InventoryLoading extends InventoryState {}

final class InventoryLoaded extends InventoryState {
  const InventoryLoaded({required this.products});

  final List<ProductEntity> products;

  @override
  List<Object> get props => [products];
}

final class InventoryError extends InventoryState {
  const InventoryError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
