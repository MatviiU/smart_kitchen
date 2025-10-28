import 'package:json_annotation/json_annotation.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/remote/models/nutrition_remote_dto.dart';

part 'product_remote_dto.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class ProductRemoteDto {
  ProductRemoteDto({
    this.allergens,
    this.brands,
    this.categories,
    this.code,
    this.imageFrontUrl,
    this.ingredientsText,
    this.nutriments,
    this.productName,
    this.quantity,
  });

  factory ProductRemoteDto.fromJson(Map<String, dynamic> json) =>
      _$ProductRemoteDtoFromJson(json);

  @JsonKey(name: 'allergens')
  final String? allergens;

  @JsonKey(name: 'brands')
  final String? brands;

  @JsonKey(name: 'categories')
  final String? categories;

  @JsonKey(name: 'code')
  final String? code;

  @JsonKey(name: 'image_front_url')
  final String? imageFrontUrl;

  @JsonKey(name: 'ingredients_text')
  final String? ingredientsText;

  @JsonKey(name: 'nutriments')
  final NutritionRemoteDTO? nutriments;

  @JsonKey(name: 'product_name')
  final String? productName;

  @JsonKey(name: 'quantity')
  final String? quantity;
}
