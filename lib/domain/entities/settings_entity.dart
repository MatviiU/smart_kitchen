import 'package:equatable/equatable.dart';

enum MeasurementUnit { metric, imperial }

class SettingsEntity extends Equatable {
  const SettingsEntity({
    required this.isDarkMode,
    required this.measurementUnit,
    required this.notificationExpiryDays,
  });

  factory SettingsEntity.initial() => const SettingsEntity(
    isDarkMode: false,
    measurementUnit: MeasurementUnit.metric,
    notificationExpiryDays: 3,
  );

  final bool isDarkMode;
  final MeasurementUnit measurementUnit;
  final int notificationExpiryDays;

  SettingsEntity copyWith({
    bool? isDarkMode,
    MeasurementUnit? measurementUnit,
    int? notificationExpiryDays,
  }) => SettingsEntity(
    isDarkMode: isDarkMode ?? this.isDarkMode,
    measurementUnit: measurementUnit ?? this.measurementUnit,
    notificationExpiryDays:
        notificationExpiryDays ?? this.notificationExpiryDays,
  );

  @override
  List<Object> get props => [
    isDarkMode,
    measurementUnit,
    notificationExpiryDays,
  ];
}
