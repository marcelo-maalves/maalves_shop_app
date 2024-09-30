import 'dart:ui' as ui;

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

abstract class ThemeService {
  static AppThemeData resolveTheme(
    BuildContext context, {
    required ThemeMode themeMode,
    AppThemeData? lightTheme,
    AppThemeData? darkTheme,
    AppThemeData? highContrastLightTheme,
    AppThemeData? highContrastDarkTheme,
  }) {
    final useDarkTheme = _resolveThemeMode(context, themeMode);
    final highContrast = MediaQuery.highContrastOf(context);

    AppThemeData? theme;
    if (useDarkTheme && highContrast) {
      theme = highContrastDarkTheme;
    } else if (useDarkTheme) {
      theme = darkTheme;
    } else if (highContrast) {
      theme = highContrastLightTheme;
    }
    return theme ?? lightTheme ?? AppThemeData.light();
  }

  /// Resolves the theme type light or dark based on [themeMode] and the
  /// platform's brightness.
  static bool _resolveThemeMode(
    BuildContext context,
    ThemeMode? themeMode,
  ) {
    final mode = themeMode ?? ThemeMode.system;
    final platformBrightness = MediaQuery.platformBrightnessOf(context);

    return mode == ThemeMode.dark ||
        (mode == ThemeMode.system && platformBrightness == ui.Brightness.dark);
  }
}
