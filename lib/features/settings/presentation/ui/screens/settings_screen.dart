import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/core/di/get_it/di_container.dart';
import 'package:smart_kitchen/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:smart_kitchen/features/settings/presentation/cubit/settings_state.dart';
import 'package:smart_kitchen/features/settings/presentation/ui/widgets/settings_form.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: BlocProvider(
        create: (context) => serviceLocator<SettingsCubit>()..loadSettings(),
        child: BlocListener<SettingsCubit, SettingsState>(
          listener: (context, state) {
            if (state is SettingsError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return switch (state) {
                SettingsInitial() || SettingsLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                SettingsLoaded() => SettingsForm(settings: state.settings),
                SettingsError() => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Unable to load settings',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<SettingsCubit>().loadSettings(),
                          child: const Text('Try again'),
                        ),
                      ],
                    ),
                  ),
                ),
              };
            },
          ),
        ),
      ),
    );
  }
}
