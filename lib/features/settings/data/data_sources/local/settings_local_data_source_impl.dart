import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_kitchen/domain/entities/settings_entity.dart';
import 'package:smart_kitchen/features/settings/data/data_sources/local/settings_local_data_source.dart';

class _PrefsKeys {
  static const String isDarkMode = 'settings_is_dark_mode';
  static const String measurementUnit = 'settings_measurement_unit';
  static const String notificationExpiry = 'settings_notification_expiry';
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  const SettingsLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<SettingsEntity> getSettings() async {
    try {
      final isDarkMode = _sharedPreferences.getBool(_PrefsKeys.isDarkMode);
      final unitString = _sharedPreferences.getString(
        _PrefsKeys.measurementUnit,
      );
      final expiryDays = _sharedPreferences.getInt(
        _PrefsKeys.notificationExpiry,
      );

      if (isDarkMode == null || unitString == null || expiryDays == null) {
        return SettingsEntity.initial();
      }

      final measurementUnit = MeasurementUnit.values.firstWhere(
        (unit) => unit.name == unitString,
        orElse: () => MeasurementUnit.metric,
      );

      return SettingsEntity(
        isDarkMode: isDarkMode,
        measurementUnit: measurementUnit,
        notificationExpiryDays: expiryDays,
      );
    } catch (e) {
      return SettingsEntity.initial();
    }
  }

  @override
  Future<void> saveDarkMode(bool isDarkMode) async {
    await _sharedPreferences.setBool(_PrefsKeys.isDarkMode, isDarkMode);
  }

  @override
  Future<void> saveMeasurementUnit(MeasurementUnit measurementUnit) async {
    await _sharedPreferences.setString(
      _PrefsKeys.measurementUnit,
      measurementUnit.name,
    );
  }

  @override
  Future<void> saveNotificationExpiry(int days) async {
    await _sharedPreferences.setInt(_PrefsKeys.notificationExpiry, days);
  }
}
