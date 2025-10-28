import 'package:dio/dio.dart';
import 'package:smart_kitchen/core/network/open_food_facts_api.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/remote/inventory_remote_data_source.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/remote/models/product_remote_dto.dart';

class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {
  InventoryRemoteDataSourceImpl({required OpenFoodFactsApi openFoodFactsApi})
    : _openFoodFactsApi = openFoodFactsApi;

  final OpenFoodFactsApi _openFoodFactsApi;

  @override
  Future<ProductRemoteDto> getProductByBarcodeFromApi({
    required String barcode,
  }) async {
    try {
      final response = await _openFoodFactsApi.getProductByBarcodeFromApi(
        barcode,
      );

      if (response.status == 1 && response.product != null) {
        return response.product!;
      } else {
        throw Exception('Product not found: ${response.statusVerbose}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to get product: $e');
    }
  }
}
