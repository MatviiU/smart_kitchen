import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_kitchen/core/di/get_it/di_container.dart';
import 'package:smart_kitchen/core/network/open_food_facts_api.dart';
import 'package:smart_kitchen/features/inventory/data/data_sources/local/database/app_database.dart';

final _featureContainers = <FeatureDIContainer>[
  SettingsDIContainer(),
  InventoryDIContainer(),
];

const String _openFoodFactsBaseUrl =
    'https://world.openfoodfacts.net/api/v2/product';

Future<void> configureDependencies() async {
  await _registerCoreDependencies(serviceLocator);

  for (final container in _featureContainers) {
    await container.registerDependencies(serviceLocator);
  }
}

Future<void> _registerCoreDependencies(GetIt sl) async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton<SharedPreferences>(() => prefs)
    ..registerLazySingleton<Dio>(() {
      final dio = Dio();
      dio.options.headers['Accept'] = 'application/json';
      return dio;
    })
    ..registerLazySingleton<OpenFoodFactsApi>(
      () => OpenFoodFactsApi(sl<Dio>(), baseUrl: _openFoodFactsBaseUrl),
    )
    ..registerLazySingleton<AppDatabase>(AppDatabase.new);
}
