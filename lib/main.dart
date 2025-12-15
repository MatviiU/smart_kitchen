import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_kitchen/core/di/get_it/di_container.dart';
import 'package:smart_kitchen/core/di/get_it/di_setup.dart';
import 'package:smart_kitchen/core/navigation/app_router.dart';
import 'package:smart_kitchen/core/theme/app_theme.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_cubit.dart';
import 'package:smart_kitchen/features/recipes/presentation/cubit/recipes_cubit.dart';
import 'package:smart_kitchen/features/scanning/presentation/cubit/scanner_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              serviceLocator<InventoryCubit>()..fetchInventory(),
        ),
        BlocProvider(create: (context) => serviceLocator<ScannerCubit>()),
        BlocProvider(
          create: (context) =>
              serviceLocator<RecipesCubit>()..findFromMyInventory(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
