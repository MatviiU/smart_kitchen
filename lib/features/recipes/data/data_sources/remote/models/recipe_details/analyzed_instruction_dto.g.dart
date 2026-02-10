// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyzed_instruction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyzedInstructionDto _$AnalyzedInstructionDtoFromJson(
  Map<String, dynamic> json,
) => AnalyzedInstructionDto(
  name: json['name'] as String?,
  steps: (json['steps'] as List<dynamic>?)
      ?.map((e) => StepDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);
