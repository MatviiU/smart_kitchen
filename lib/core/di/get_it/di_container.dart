import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_kitchen/features/settings/data/data_sources/local/settings_local_data_source.dart';
import 'package:smart_kitchen/features/settings/data/data_sources/local/settings_local_data_source_impl.dart';
import 'package:smart_kitchen/features/settings/data/repositories/settings_repository.dart';
import 'package:smart_kitchen/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:smart_kitchen/features/settings/presentation/cubit/settings_cubit.dart';

final serviceLocator = GetIt.instance;

abstract interface class FeatureDIContainer {
  Future<void> registerDependencies(GetIt sl);
}

class SettingsDIContainer implements FeatureDIContainer {
  @override
  Future<void> registerDependencies(GetIt sl) async {
    sl
      ..registerLazySingleton<SettingsLocalDataSource>(
        () => SettingsLocalDataSourceImpl(
          sharedPreferences: sl<SharedPreferences>(),
        ),
      )
      ..registerLazySingleton<SettingsRepository>(
        () => SettingsRepositoryImpl(
          settingsLocalDataSource: sl<SettingsLocalDataSource>(),
        ),
      )
      ..registerFactory<SettingsCubit>(
        () => SettingsCubit(settingsRepository: sl<SettingsRepository>()),
      );
  }
}
