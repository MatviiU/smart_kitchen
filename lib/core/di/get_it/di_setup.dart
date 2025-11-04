import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_kitchen/core/database/app_database.dart';
import 'package:smart_kitchen/core/di/get_it/di_container.dart';
import 'package:smart_kitchen/core/network/open_food_facts_api.dart';
import 'package:smart_kitchen/core/network/recipe_api.dart';

final _featureContainers = <FeatureDIContainer>[
  SettingsDIContainer(),
  InventoryDIContainer(),
  ScannerDIContainer(),
  RecipeDIContainer(),
];

const String _openFoodFactsBaseUrl =
    'https://world.openfoodfacts.net/api/v2/product';
const String _recipeBaseUrl = 'https://api.spoonacular.com/recipes';

Future<void> configureDependencies() async {
  await _registerCoreDependencies(serviceLocator);

  for (final container in _featureContainers) {
    await container.registerDependencies(serviceLocator);
  }
}

Future<void> _registerCoreDependencies(GetIt sl) async {
  final spoonacularApiKey = dotenv.env['SPOONACULAR_API_KEY'];
  if (spoonacularApiKey == null) {
    throw Exception('Failed to load SPOONACULAR_API_KEY from .env file');
  }
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton<SharedPreferences>(() => prefs)
    ..registerLazySingleton<AppDatabase>(AppDatabase.new);
  final foodFactsDio = Dio();
  foodFactsDio.options.headers['Accept'] = 'application/json';

  sl.registerLazySingleton<OpenFoodFactsApi>(
    () => OpenFoodFactsApi(foodFactsDio, baseUrl: _openFoodFactsBaseUrl),
  );

  final spoonacularDio = Dio();
  spoonacularDio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['x-api-key'] = spoonacularApiKey;
        options.headers['Accept'] = 'application/json';
        return handler.next(options);
      },
    ),
  );
  sl.registerLazySingleton<RecipeApi>(
    () => RecipeApi(spoonacularDio, baseUrl: _recipeBaseUrl),
  );
}
