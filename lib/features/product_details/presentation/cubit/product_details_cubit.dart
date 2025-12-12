import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/features/inventory/data/repositories/inventory_repository.dart';
import 'package:smart_kitchen/features/product_details/presentation/cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit({required InventoryRepository inventoryRepository})
    : _inventoryRepository = inventoryRepository,
      super(ProductDetailsInitial());

  final InventoryRepository _inventoryRepository;

  Future<void> fetchProduct({required String barcode}) async {
    try {
      final product = await _inventoryRepository.getProductByBarcode(
        barcode: barcode,
      );
      emit(ProductDetailsLoaded(product: product!));
    } catch (e) {
      emit(ProductDetailsError(message: e.toString()));
    }
  }
}
