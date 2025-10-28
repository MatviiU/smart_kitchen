import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/inventory/data/repositories/inventory_repository.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  InventoryCubit({required InventoryRepository inventoryRepository})
    : _inventoryRepository = inventoryRepository,
      super(InventoryInitial());

  final InventoryRepository _inventoryRepository;

  Future<void> fetchInventory() async {
    emit(InventoryLoading());
    try {
      final inventory = await _inventoryRepository.getAllProducts();
      emit(InventoryLoaded(products: inventory));
    } catch (e) {
      emit(InventoryError(message: e.toString()));
    }
  }

  Future<void> addProductByBarcode({required String barcode}) async {
    emit(InventoryLoading());
    try {
      final newProduct = await _inventoryRepository.getProductByBarcode(
        barcode: barcode,
      );
      var currentProducts = <ProductEntity>[];
      if (state is InventoryLoaded) {
        currentProducts = (state as InventoryLoaded).products;
      }

      final productExists = currentProducts.any(
        (product) => product.barcode == newProduct.barcode,
      );

      if (productExists) {
        emit(InventoryLoaded(products: currentProducts));
        return;
      }

      final updatedProducts = [...currentProducts, newProduct];
      emit(InventoryLoaded(products: updatedProducts));
    } catch (e) {
      emit(InventoryError(message: e.toString()));
      await fetchInventory();
    }
  }

  Future<void> removeProduct({required String barcode}) async {
    if (state is! InventoryLoaded) return;
    final currentList = (state as InventoryLoaded).products;
    final updatedList = currentList
        .where((product) => product.barcode != barcode)
        .toList();
    emit(InventoryLoaded(products: updatedList));
    try {
      await _inventoryRepository.deleteProductByBarcode(barcode: barcode);
      await fetchInventory();
    } catch (e) {
      emit(InventoryError(message: e.toString()));
      emit(InventoryLoaded(products: currentList));
    }
  }
}
