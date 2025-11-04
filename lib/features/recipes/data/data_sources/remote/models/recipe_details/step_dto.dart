import 'package:json_annotation/json_annotation.dart';

part 'step_dto.g.dart';

@JsonSerializable(createToJson: false)
class StepDto {
  const StepDto({this.number, this.step});

  factory StepDto.fromJson(Map<String, dynamic> json) =>
      _$StepDtoFromJson(json);
  @JsonKey(name: 'number')
  final int? number;

  @JsonKey(name: 'step')
  final String? step;
}
