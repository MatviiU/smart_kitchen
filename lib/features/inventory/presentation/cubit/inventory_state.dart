import 'package:equatable/equatable.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';

enum InventoryFilter { all, favorites, expiringSoon, expired }

sealed class InventoryState extends Equatable {
  const InventoryState();

  @override
  List<Object> get props => [];
}

final class InventoryInitial extends InventoryState {}

final class InventoryLoading extends InventoryState {}

final class InventoryLoaded extends InventoryState {
  const InventoryLoaded({
    required this.products,
    this.filter = InventoryFilter.all,
  });

  final List<ProductEntity> products;
  final InventoryFilter filter;

  InventoryLoaded copyWith({
    List<ProductEntity>? products,
    InventoryFilter? filter,
  }) {
    return InventoryLoaded(
      products: products ?? this.products,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [products, filter];
}

final class InventoryProductNotFound extends InventoryState {
  const InventoryProductNotFound({required this.barcode});

  final String barcode;

  @override
  List<Object> get props => [barcode];
}

final class InventoryError extends InventoryState {
  const InventoryError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
