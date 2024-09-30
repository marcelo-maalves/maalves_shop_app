import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'buttons_theme.dart';
import 'colors_theme.dart';
import 'inputs_theme.dart';
import 'scroll_behavior.dart';
import 'typography_theme.dart';

/// The main theme used by the [App].
/// This is the root theme for most or all of App design system's
/// foundational values.
///
/// It should be noted that if you want to access material's values, then use
/// [Theme.of].
class AppTheme extends Provider<AppThemeData> {
  AppTheme({
    Key? key,
    required AppThemeData data,
    required Widget child,
  }) : super.value(
          key: key,
          value: data,
          child: ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: child,
          ),
        );

  static AppThemeData of(BuildContext context, {bool listen = true}) {
    try {
      return Provider.of<AppThemeData>(context, listen: listen);
    } on ProviderNotFoundException {
      return _fallback;
    }
  }

  /// This fallback is only for conditions where the theme wasn't or can't be
  /// inserted, like tests.
  ///
  /// A theme value should always have been provided in normal conditions..
  static final AppThemeData _fallback = AppThemeData.light();
}

@immutable
class AppThemeData extends Equatable {
  const AppThemeData({
    required this.material,
    required this.textTheme,
    required this.buttonTheme,
    required this.colorScheme,
  });

  factory AppThemeData.light() {
    final colorScheme = TColors.light();
    final textTheme = TTypography(colorScheme);
    final buttonTheme = TButtonTheme(colorScheme);

    return AppThemeData(
      material: ThemeData(
        brightness: Brightness.light,
        textTheme: textTheme,
        primaryColor: colorScheme.primaryMain,
        scaffoldBackgroundColor: colorScheme.neutralTransparent,
        primarySwatch: colorScheme.primaryMain.swatch,
        outlinedButtonTheme: TButtons.outlinedButtonTheme(colorScheme),
        elevatedButtonTheme: TButtons.elevatedButtonTheme,
        textButtonTheme: TButtons.textButtonTheme,
        inputDecorationTheme: TInputs.inputDecorationTheme(
          textTheme,
          colorScheme,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      textTheme: textTheme,
      buttonTheme: buttonTheme,
      colorScheme: colorScheme,
    );
  }

  /// This is only for passing through the [WidgetsApp] and should NOT be
  /// accessed directly by the components.
  /// Use the regular [Theme.of] access instead.
  final ThemeData material;
  final TTypography textTheme;
  final TButtonTheme buttonTheme;
  final TColors colorScheme;

  @override
  List get props => [material, textTheme, buttonTheme, colorScheme];
}
