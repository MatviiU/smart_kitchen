import 'package:json_annotation/json_annotation.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/remote/models/product_remote_dto.dart';

part 'product_response_dto.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class ProductResponseDto {
  ProductResponseDto({
    this.code,
    this.product,
    this.status,
    this.statusVerbose,
  });

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseDtoFromJson(json);

  @JsonKey(name: 'code')
  final String? code;

  @JsonKey(name: 'product')
  final ProductRemoteDto? product;

  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'status_verbose')
  final String? statusVerbose;
}
