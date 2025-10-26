import 'package:smart_kitchen/domain/entities/settings_entity.dart';

abstract interface class SettingsLocalDataSource {
  Future<SettingsEntity> getSettings();

  Future<void> saveDarkMode(bool isDarkMode);

  Future<void> saveMeasurementUnit(MeasurementUnit measurementUnit);

  Future<void> saveNotificationExpiry(int days);
}
