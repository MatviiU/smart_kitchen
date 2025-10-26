import 'package:equatable/equatable.dart';
import 'package:smart_kitchen/domain/entities/settings_entity.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class SettingsLoaded extends SettingsState {
  const SettingsLoaded({required this.settings});

  final SettingsEntity settings;

  @override
  List<Object> get props => [settings];
}

final class SettingsError extends SettingsState {
  const SettingsError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
