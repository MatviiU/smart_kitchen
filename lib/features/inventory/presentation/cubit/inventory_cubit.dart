import 'package:flutter/material.dart';
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
      if (newProduct == null) {
        emit(InventoryProductNotFound(barcode: barcode));
        return;
      }
      final currentProducts = state is InventoryLoaded
          ? (state as InventoryLoaded).products
          : <ProductEntity>[];

      final productExists = currentProducts.any(
        (product) => product.barcode == newProduct.barcode,
      );

      if (productExists) {
        emit(InventoryLoaded(products: currentProducts));
        return;
      }
      await _saveProductToDb(
        product: newProduct,
        products: [...currentProducts, newProduct],
      );
      final current = await _inventoryRepository.getAllProducts();
      debugPrint('db count: ${current.length}');
    } catch (e) {
      emit(InventoryError(message: e.toString()));
      await fetchInventory();
    }
  }

  Future<void> addProductManually({required ProductEntity product}) async {
    final currentProducts = state is InventoryLoaded
        ? (state as InventoryLoaded).products
        : <ProductEntity>[];

    final exists = currentProducts.any((p) => p.barcode == product.barcode);
    if (exists) {
      emit(InventoryLoaded(products: currentProducts));
      return;
    }

    try {
      emit(InventoryLoading());
      await _inventoryRepository.saveProduct(product: product);
      final updated = [...currentProducts, product];
      emit(InventoryLoaded(products: updated));
    } catch (e) {
      emit(const InventoryError(message: 'Failed to save product'));
      await fetchInventory();
    }
  }

  Future<void> _saveProductToDb({
    required ProductEntity product,
    required List<ProductEntity> products,
  }) async {
    await _inventoryRepository.saveProduct(product: product);
    emit(InventoryLoaded(products: products));
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

  Future<void> searchProducts({required String query}) async {
    final currentState = state;
    if (currentState is InventoryLoaded) {
      final filteredProducts = _filterProducts(
        products: currentState.products,
        query: query,
      );
      emit(InventoryLoaded(products: filteredProducts));
    }
  }

  Future<void> toggleFavoriteByBarcode({required String barcode}) async {
    final currentState = state;
    if (currentState is! InventoryLoaded) {
      return;
    }
    try {
      await _inventoryRepository.toggleProductFavoriteStatus(barcode: barcode);
    } catch (e) {
      emit(InventoryError(message: e.toString()));
    }

    final productIndex = currentState.products.indexWhere(
      (product) => product.barcode == barcode,
    );
    if (productIndex == -1) {
      return;
    }

    final updatedProducts = currentState.products.map((product) {
      if (product.barcode == barcode) {
        return product.copyWith(isFavorite: !product.isFavorite);
      }
      return product;
    }).toList();
    emit(currentState.copyWith(products: updatedProducts));
  }

  void setFilter({required InventoryFilter filter}) {
    if (state is InventoryLoaded) {
      final currentState = state as InventoryLoaded;
      emit(currentState.copyWith(filter: filter));
    }
  }

  List<ProductEntity> _filterProducts({
    required List<ProductEntity> products,
    required String query,
    // String? tag,
  }) {
    var filteredProducts = [...products];
    // if(tag != null){
    //   filteredProducts = filteredProducts
    //       .where((note) => note.tags.contains(tag))
    //       .toList();
    // }

    if (query.isNotEmpty) {
      final lowerCaseQuery = query.toLowerCase();
      filteredProducts = filteredProducts.where((product) {
        final productMatch = product.name.toLowerCase().contains(
          lowerCaseQuery,
        );
        final brandMatch = product.brand.toLowerCase().contains(lowerCaseQuery);
        final barcodeMatch = product.barcode.toLowerCase().contains(
          lowerCaseQuery,
        );
        return productMatch || brandMatch || barcodeMatch;
      }).toList();
    }
    return filteredProducts;
  }
}
