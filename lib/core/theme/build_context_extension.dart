import 'package:flutter/material.dart';
import 'package:smart_kitchen/core/theme/app_colors.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  AppColorsExtension get colors => theme.extension<AppColorsExtension>()!;
}
