import 'package:smart_kitchen/domain/entities/settings_entity.dart';
import 'package:smart_kitchen/features/settings/data/data_sources/local/settings_local_data_source.dart';
import 'package:smart_kitchen/features/settings/data/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl({
    required SettingsLocalDataSource settingsLocalDataSource,
  }) : _settingsLocalDataSource = settingsLocalDataSource;

  final SettingsLocalDataSource _settingsLocalDataSource;

  @override
  Future<SettingsEntity> getSettings() async {
    return _settingsLocalDataSource.getSettings();
  }

  @override
  Future<void> saveDarkMode(bool isDarkMode) async {
    await _settingsLocalDataSource.saveDarkMode(isDarkMode);
  }

  @override
  Future<void> saveMeasurementUnit(MeasurementUnit measurementUnit) async {
    await _settingsLocalDataSource.saveMeasurementUnit(measurementUnit);
  }

  @override
  Future<void> saveNotificationExpiry(int days) async {
    await _settingsLocalDataSource.saveNotificationExpiry(days);
  }
}
