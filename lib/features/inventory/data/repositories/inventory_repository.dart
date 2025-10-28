import 'package:smart_kitchen/domain/entities/product_entity.dart';

abstract interface class InventoryRepository {
  Future<ProductEntity> getProductByBarcode({required String barcode});

  Future<List<ProductEntity>> getAllProducts();

  Future<void> saveProduct({required ProductEntity product});

  Future<void> deleteProductByBarcode({required String barcode});
}
