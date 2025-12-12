import 'package:flutter/material.dart';
import 'package:smart_kitchen/core/theme/app_colors.dart';
import 'package:smart_kitchen/core/theme/app_typography.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    extensions: const [AppColorsExtension.light],
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColorsExtension.light.onSurface,
      displayColor: AppColorsExtension.light.onSurface,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColorsExtension.light.primary,
      onPrimary: AppColorsExtension.light.onPrimary,
      secondary: const Color(0xFF585E71),
      onSecondary: Colors.white,
      secondaryContainer: AppColorsExtension.light.secondaryContainer,
      onSecondaryContainer: AppColorsExtension.light.onSecondaryContainer,
      error: AppColorsExtension.light.error,
      onError: Colors.white,
      surface: AppColorsExtension.light.surface,
      onSurface: AppColorsExtension.light.onSurface,
      outline: AppColorsExtension.light.outline,
      surfaceContainerHigh: AppColorsExtension.light.surfaceContainerHigh,
      onSurfaceVariant: AppColorsExtension.light.onSurfaceVariant,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    extensions: const [AppColorsExtension.dark],
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColorsExtension.dark.onSurface,
      displayColor: AppColorsExtension.dark.onSurface,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColorsExtension.dark.primary,
      onPrimary: AppColorsExtension.dark.onPrimary,
      secondary: const Color(0xFFC4C6D0),
      onSecondary: const Color(0xFF2E3038),
      secondaryContainer: AppColorsExtension.dark.secondaryContainer,
      onSecondaryContainer: AppColorsExtension.dark.onSecondaryContainer,
      error: AppColorsExtension.dark.error,
      onError: const Color(0xFF690005),
      surface: AppColorsExtension.dark.surface,
      onSurface: AppColorsExtension.dark.onSurface,
      outline: AppColorsExtension.dark.outline,
      surfaceContainerHigh: AppColorsExtension.dark.surfaceContainerHigh,
      onSurfaceVariant: AppColorsExtension.dark.onSurfaceVariant,
    ),
  );
}
