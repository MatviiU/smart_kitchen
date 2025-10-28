import 'package:smart_kitchen/features/inventory/data/data_sources/remote/models/product_remote_dto.dart';

abstract interface class InventoryRemoteDataSource {
  Future<ProductRemoteDto> getProductByBarcodeFromApi({
    required String barcode,
  });
}
