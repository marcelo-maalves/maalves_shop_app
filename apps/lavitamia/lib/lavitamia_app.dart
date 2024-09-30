import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:foundation/foundation.dart';
import 'package:foundation/go_router.dart';
import 'package:lavitamia_app/router/lavitamia_router_register.dart';
import 'package:lavitamia_app/services/theme_service.dart';

class LavitamiaApp extends StatefulWidget {
  const LavitamiaApp({
    super.key,
    this.locale,
    this.supportedLocales = const [Locale('pt', 'BR')],
    required this.localizationsDelegates,
    this.themeMode = ThemeMode.light,
    this.lightTheme,
    this.darkTheme,
    this.highContrastLightTheme,
    this.highContrastDarkTheme,
    this.builder,
  });

  final Locale? locale;
  final List<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final ThemeMode themeMode;
  final AppThemeData? lightTheme;
  final AppThemeData? darkTheme;
  final AppThemeData? highContrastLightTheme;
  final AppThemeData? highContrastDarkTheme;
  final TransitionBuilder? builder;

  @override
  State<LavitamiaApp> createState() => _LavitamiaAppState();
}

class _LavitamiaAppState extends State<LavitamiaApp> {
  late AppRouterRegister _router;

  @override
  void initState() {
    super.initState();
    _router = LavitamiaRouterRegister();
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: widget.key,
      title: 'Marketplace',
      locale: widget.locale,
      supportedLocales: widget.supportedLocales,
      localizationsDelegates: widget.localizationsDelegates,
      routerConfig: _router,
      themeMode: widget.themeMode,
      builder: (context, child) {
        final theme = ThemeService.resolveTheme(
          context,
          themeMode: widget.themeMode,
          lightTheme: widget.lightTheme,
          darkTheme: widget.darkTheme,
          highContrastLightTheme: widget.highContrastLightTheme,
          highContrastDarkTheme: widget.highContrastDarkTheme,
        );

        return AppTheme(
          data: theme,
          // overriding the theme behavior of MaterialApp
          child: AnimatedTheme(
            data: theme.material,
            child: widget.builder != null
                ? widget.builder!(context, child)
                : child ?? emptyWidget,
          ),
        );
      },
    );
  }
}
