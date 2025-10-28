import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_kitchen/core/network/open_food_facts_api.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/local/database/app_database.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/local/inventory_local_data_source.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/local/inventory_local_data_source_impl.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/remote/inventory_remote_data_source.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/remote/inventory_remote_data_source_impl.dart';
import 'package:smart_kitchen/features/inventory/data/repositories/inventory_repository.dart';
import 'package:smart_kitchen/features/inventory/data/repositories/inventory_repository_impl.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_cubit.dart';
import 'package:smart_kitchen/features/scanning/presentation/cubit/scanner_cubit.dart';
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

class InventoryDIContainer implements FeatureDIContainer {
  @override
  Future<void> registerDependencies(GetIt sl) async {
    sl
      ..registerLazySingleton<InventoryRemoteDataSource>(
        () => InventoryRemoteDataSourceImpl(
          openFoodFactsApi: sl<OpenFoodFactsApi>(),
        ),
      )
      ..registerLazySingleton<InventoryLocalDataSource>(
        () => InventoryLocalDataSourceImpl(database: sl<AppDatabase>()),
      )
      ..registerLazySingleton<InventoryRepository>(
        () => InventoryRepositoryImpl(
          inventoryLocalDataSource: sl<InventoryLocalDataSource>(),
          inventoryRemoteDataSource: sl<InventoryRemoteDataSource>(),
        ),
      )
      ..registerFactory<InventoryCubit>(
        () => InventoryCubit(inventoryRepository: sl<InventoryRepository>()),
      );
  }
}

class ScannerDIContainer implements FeatureDIContainer {
  @override
  Future<void> registerDependencies(GetIt sl) async {
    sl.registerFactory<ScannerCubit>(ScannerCubit.new);
  }
}
