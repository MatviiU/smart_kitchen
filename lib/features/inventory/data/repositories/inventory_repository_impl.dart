import 'package:smart_kitchen/domain/entities/product_entity.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/local/inventory_local_data_source.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/remote/inventory_remote_data_source.dart';
import 'package:smart_kitchen/features/inventory/data/mappers/product_mapper.dart';
import 'package:smart_kitchen/features/inventory/data/repositories/inventory_repository.dart';
import 'package:smart_kitchen/features/inventory/exeptions/product_not_found_exeption.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  const InventoryRepositoryImpl({
    required InventoryLocalDataSource inventoryLocalDataSource,
    required InventoryRemoteDataSource inventoryRemoteDataSource,
  }) : _inventoryLocalDataSource = inventoryLocalDataSource,
       _inventoryRemoteDataSource = inventoryRemoteDataSource;

  final InventoryLocalDataSource _inventoryLocalDataSource;
  final InventoryRemoteDataSource _inventoryRemoteDataSource;

  @override
  Future<void> deleteProductByBarcode({required String barcode}) async {
    await _inventoryLocalDataSource.deleteProductByBarcodeFromDb(
      barcode: barcode,
    );
  }

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final products = await _inventoryLocalDataSource.getAllProductsFromDb();
    return products;
  }

  @override
  Future<ProductEntity?> getProductByBarcode({required String barcode}) async {
    try {
      final localProduct = await _inventoryLocalDataSource
          .getProductByBarcodeFromDb(barcode: barcode);
      if (localProduct != null) {
        return localProduct;
      }
      final remoteProductDto = await _inventoryRemoteDataSource
          .getProductByBarcodeFromApi(barcode: barcode);

      final isFavoriteStatus = await _inventoryLocalDataSource
          .isProductFavorite(barcode: barcode);

      final productEntity = ProductMapper.mapRemoteDtoToEntity(
        remoteProductDto,
        isFavoriteStatus,
      );

      await _inventoryLocalDataSource.saveProductToDb(product: productEntity);
      return productEntity;
    } on ProductNotFoundException {
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveProduct({required ProductEntity product}) async {
    await _inventoryLocalDataSource.saveProductToDb(product: product);
  }

  @override
  Future<void> toggleProductFavoriteStatus({required String barcode}) async {
    await _inventoryLocalDataSource.toggleProductFavoriteStatus(
      barcode: barcode,
    );
  }
}
