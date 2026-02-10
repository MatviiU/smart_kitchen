// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseDto _$ProductResponseDtoFromJson(Map<String, dynamic> json) =>
    ProductResponseDto(
      code: json['code'] as String?,
      product: json['product'] == null
          ? null
          : ProductRemoteDto.fromJson(json['product'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      statusVerbose: json['status_verbose'] as String?,
    );
