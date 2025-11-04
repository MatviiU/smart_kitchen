import 'package:json_annotation/json_annotation.dart';
import 'package:smart_kitchen/features/recipes/data/data_sources/remote/models/recipe_details/step_dto.dart';

part 'analyzed_instruction_dto.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class AnalyzedInstructionDto {
  const AnalyzedInstructionDto({this.name, this.steps});

  factory AnalyzedInstructionDto.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedInstructionDtoFromJson(json);
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'steps')
  final List<StepDto>? steps;
}
