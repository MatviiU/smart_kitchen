import 'package:smart_kitchen/core/database/app_database.dart';
import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/local/inventory_local_data_source.dart';
import 'package:smart_kitchen/features/inventory/data/mappers/product_mapper.dart';

class InventoryLocalDataSourceImpl implements InventoryLocalDataSource {
  InventoryLocalDataSourceImpl({required AppDatabase database})
    : _database = database;

  final AppDatabase _database;

  @override
  Future<void> deleteProductByBarcodeFromDb({required String barcode}) async {
    return _database.deleteProductByBarcodeFromDb(barcode: barcode);
  }

  @override
  Future<List<ProductEntity>> getAllProductsFromDb() async {
    final dbProducts = await _database.getAllProductsFromDb();
    return dbProducts.map(ProductMapper.mapDbDataToEntity).toList();
  }

  @override
  Future<ProductEntity?> getProductByBarcodeFromDb({
    required String barcode,
  }) async {
    final dbProduct = await _database.getProductByBarcodeFromDb(
      barcode: barcode,
    );

    if (dbProduct == null) {
      return null;
    } else {
      return ProductMapper.mapDbDataToEntity(dbProduct);
    }
  }

  @override
  Future<void> saveProductToDb({required ProductEntity product}) async {
    final dbCompanion = ProductMapper.mapEntityToDbCompanion(product);
    return _database.saveProductToDb(product: dbCompanion);
  }
}
