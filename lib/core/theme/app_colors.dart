import 'package:flutter/material.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.surfaceContainerHigh,
    required this.onSurfaceVariant,
    required this.outline,
    required this.surface,
    required this.onSurface,
    required this.error,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color surfaceContainerHigh;
  final Color onSurfaceVariant;
  final Color outline;
  final Color surface;
  final Color onSurface;
  final Color error;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? surfaceContainerHigh,
    Color? onSurfaceVariant,
    Color? outline,
    Color? surface,
    Color? onSurface,
    Color? error,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      outline: outline ?? this.outline,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondaryContainer: Color.lerp(
        secondaryContainer,
        other.secondaryContainer,
        t,
      )!,
      onSecondaryContainer: Color.lerp(
        onSecondaryContainer,
        other.onSecondaryContainer,
        t,
      )!,
      surfaceContainerHigh: Color.lerp(
        surfaceContainerHigh,
        other.surfaceContainerHigh,
        t,
      )!,
      onSurfaceVariant: Color.lerp(
        onSurfaceVariant,
        other.onSurfaceVariant,
        t,
      )!,
      outline: Color.lerp(outline, other.outline, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }

  static const light = AppColorsExtension(
    primary: Color(0xFF4355B9),
    onPrimary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFDDE1FF),
    onSecondaryContainer: Color(0xFF001256),
    surfaceContainerHigh: Color(0xFFE3E4EB),
    onSurfaceVariant: Color(0xFF45464F),
    outline: Color(0xFF757780),
    surface: Color(0xFFFDFBFF),
    onSurface: Color(0xFF1A1B23),
    error: Color(0xFFBA1A1A),
  );

  static const dark = AppColorsExtension(
    primary: Color(0xffBCC5FF),
    onPrimary: Color(0xff001E92),
    secondaryContainer: Color(0xff303E8E),
    onSecondaryContainer: Color(0xffE0E0FF),
    surfaceContainerHigh: Color(0xff26272F),
    onSurfaceVariant: Color(0xffC4C6D0),
    outline: Color(0xff8E9099),
    surface: Color(0xff121318),
    onSurface: Color(0xffE3E2E6),
    error: Color(0xffFFB4AB),
  );
}
