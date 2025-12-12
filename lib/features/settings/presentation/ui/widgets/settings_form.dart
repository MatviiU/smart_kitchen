import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/domain/entities/settings_entity.dart';
import 'package:smart_kitchen/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:smart_kitchen/features/settings/presentation/ui/widgets/expiry_selector.dart';
import 'package:smart_kitchen/features/settings/presentation/ui/widgets/section_header.dart';
import 'package:smart_kitchen/features/settings/presentation/ui/widgets/units_dropdown.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({required this.settings, super.key});

  final SettingsEntity settings;

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  late bool _isDarkMode;
  late MeasurementUnit _measurementUnit;
  late int _notificationExpiryDays;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.settings.isDarkMode;
    _measurementUnit = widget.settings.measurementUnit;
    _notificationExpiryDays = widget.settings.notificationExpiryDays;
  }

  Future<void> _saveDarkMode({required bool isDarkMode}) async {
    final cubit = context.read<SettingsCubit>();
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _isDarkMode = isDarkMode);
    try {
      await cubit.saveDarkMode(isDarkMode: isDarkMode);
      if (!mounted) return;
      messenger.showSnackBar(const SnackBar(content: Text('Theme changed')));
    } catch (e) {
      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text('Failed to save theme: $e')),
      );
    }
  }

  Future<void> _saveMeasurementUnit({
    required MeasurementUnit measurementUnit,
  }) async {
    final cubit = context.read<SettingsCubit>();
    final messenger = ScaffoldMessenger.of(context);

    setState(() => _measurementUnit = measurementUnit);

    try {
      await cubit.saveMeasurementUnit(measurementUnit: measurementUnit);
      if (!mounted) return;
      messenger.showSnackBar(
        const SnackBar(content: Text('Units of measurement retained')),
      );
    } catch (e) {
      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text('Failed to save units: $e')),
      );
    }
  }

  Future<void> _saveNotificationExpiryDays({
    required int notificationExpiryDays,
  }) async {
    final cubit = context.read<SettingsCubit>();
    final messenger = ScaffoldMessenger.of(context);

    setState(() => _notificationExpiryDays = notificationExpiryDays);

    try {
      await cubit.saveNotificationExpiry(days: notificationExpiryDays);
      if (!mounted) return;
      messenger.showSnackBar(
        const SnackBar(content: Text('Notifications retained')),
      );
    } catch (e) {
      if (!mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text('Failed to save expiry: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        const SectionHeader(title: 'Design'),
        SwitchListTile.adaptive(
          value: _isDarkMode,
          onChanged: (bool isDarkMode) => _saveDarkMode(isDarkMode: isDarkMode),
          title: const Text('Dark mode'),
          subtitle: const Text('Enable dark theme'),
          secondary: const Icon(Icons.dark_mode),
        ),
        const Divider(height: 1),
        const SectionHeader(title: 'Units of measurement'),
        ListTile(
          leading: const Icon(Icons.straighten),
          title: const Text('Units'),
          subtitle: Text(
            _measurementUnit == MeasurementUnit.metric
                ? 'Metric (g, ml, km)'
                : 'Imperial (oz, fl oz, mi)',
          ),
          trailing: UnitsDropdown(
            measurementUnit: _measurementUnit,
            onUnitChanged: (MeasurementUnit measurementUnit) =>
                _saveMeasurementUnit(measurementUnit: measurementUnit),
          ),
        ),
        const Divider(height: 1),
        const SectionHeader(title: 'Notifications'),
        ListTile(
          leading: const Icon(Icons.timer),
          title: const Text('Expiration date reminder'),
          subtitle: Text(
            'Remind  $_notificationExpiryDays days  before expiration',
          ),
          trailing: ExpirySelector(
            notificationExpiryDays: _notificationExpiryDays,
            onExpiryChanged: (int notificationExpiryDays) =>
                _saveNotificationExpiryDays(
                  notificationExpiryDays: notificationExpiryDays,
                ),
          ),
        ),
      ],
    );
  }
}
