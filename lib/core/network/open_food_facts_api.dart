import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/remote/models/product_response_dto.dart';

part 'open_food_facts_api.g.dart';

const String _apiFields =
    'product_name,brands,code,quantity,image_front_url,'
    'categories,nutriments,allergens,ingredients_text';

@RestApi()
abstract class OpenFoodFactsApi {
  factory OpenFoodFactsApi(Dio dio, {String baseUrl}) = _OpenFoodFactsApi;

  @GET('/{barcode}')
  Future<ProductResponseDto> getProductByBarcodeFromApi(
    @Path('barcode') String barcode, {
    @Query('fields') String fields = _apiFields,
  });
}
