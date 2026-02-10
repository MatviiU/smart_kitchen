// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_remote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRemoteDto _$ProductRemoteDtoFromJson(Map<String, dynamic> json) =>
    ProductRemoteDto(
      allergens: json['allergens'] as String?,
      brands: json['brands'] as String?,
      categories: json['categories'] as String?,
      code: json['code'] as String?,
      imageFrontUrl: json['image_front_url'] as String?,
      ingredientsText: json['ingredients_text'] as String?,
      nutriments: json['nutriments'] == null
          ? null
          : NutritionRemoteDTO.fromJson(
              json['nutriments'] as Map<String, dynamic>,
            ),
      productName: json['product_name'] as String?,
      quantity: json['quantity'] as String?,
    );
