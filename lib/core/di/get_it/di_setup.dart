import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_kitchen/core/di/get_it/di_container.dart';

final _featureContainers = <FeatureDIContainer>[SettingsDIContainer()];

Future<void> configureDependencies() async {
  await _registerCoreDependencies(serviceLocator);

  for (final container in _featureContainers) {
    await container.registerDependencies(serviceLocator);
  }
}

Future<void> _registerCoreDependencies(GetIt sl) async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
}
