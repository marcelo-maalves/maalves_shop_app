import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foundation/foundation.dart';
import 'package:maalves_shop/sample_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.mainLocale = const Locale('pt', 'BR'),
  });

  final Locale mainLocale;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SampleApp(
      lightTheme: AppThemeData.light(),
      locale: mainLocale,
      supportedLocales: [mainLocale],
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        L10nDelegate(locales: [mainLocale]),
      ],
      /*builder: (_, child) => MultiBlocProvider(
        providers: const [],
        child: child ?? emptyWidget,
      ),*/
    );
  }
}
