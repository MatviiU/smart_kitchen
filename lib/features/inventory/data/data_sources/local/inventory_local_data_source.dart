import 'package:smart_kitchen/domain/entities/product_entity.dart';

abstract interface class InventoryLocalDataSource {
  Future<ProductEntity?> getProductByBarcodeFromDb({required String barcode});

  Future<List<ProductEntity>> getAllProductsFromDb();

  Future<void> saveProductToDb({required ProductEntity product});

  Future<void> deleteProductByBarcodeFromDb({required String barcode});
}
