import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/domain/entities/settings_entity.dart';
import 'package:smart_kitchen/features/settings/data/repositories/settings_repository.dart';
import 'package:smart_kitchen/features/settings/presentation/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(SettingsInitial());

  final SettingsRepository _settingsRepository;

  Future<void> loadSettings() async {
    try {
      emit(SettingsLoading());
      final settings = await _settingsRepository.getSettings();
      emit(SettingsLoaded(settings: settings));
    } catch (e) {
      emit(SettingsError(message: 'Failed to load settings: $e'));
    }
  }

  Future<void> saveDarkMode({required bool isDarkMode}) async {
    final currentState = state;
    if (currentState is SettingsLoaded) {
      final updatedSettings = currentState.settings.copyWith(
        isDarkMode: isDarkMode,
      );
      emit(SettingsLoaded(settings: updatedSettings));
      try {
        await _settingsRepository.saveDarkMode(isDarkMode);
      } catch (e) {
        emit(SettingsError(message: 'Failed to save settings: $e'));
        emit(currentState);
      }
    }
  }

  Future<void> saveMeasurementUnit({
    required MeasurementUnit measurementUnit,
  }) async {
    final currentState = state;
    if (currentState is SettingsLoaded) {
      final updatedSettings = currentState.settings.copyWith(
        measurementUnit: measurementUnit,
      );
      emit(SettingsLoaded(settings: updatedSettings));
      try {
        await _settingsRepository.saveMeasurementUnit(measurementUnit);
      } catch (e) {
        emit(SettingsError(message: 'Failed to save settings: $e'));
        emit(currentState);
      }
    }
  }

  Future<void> saveNotificationExpiry({required int days}) async {
    final currentState = state;
    if (currentState is SettingsLoaded) {
      final updatedSettings = currentState.settings.copyWith(
        notificationExpiryDays: days,
      );
      emit(SettingsLoaded(settings: updatedSettings));
      try {
        await _settingsRepository.saveNotificationExpiry(days);
      } catch (e) {
        emit(SettingsError(message: 'Failed to save settings: $e'));
        emit(currentState);
      }
    }
  }
}
