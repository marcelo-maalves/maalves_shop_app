import 'package:flutter/material.dart';
import 'package:i18next/i18next.dart';
import 'package:intl/intl.dart';

class L10nDelegate extends I18NextLocalizationDelegate {
  L10nDelegate({
    required List<Locale> locales,
  }) : super(
          locales: locales,
          dataSource: AssetBundleLocalizationDataSource(
            // This is the path for the files declared in pubspec
            // which should  contain all of your localizations
            bundlePath: 'localizations',
          ),
          options: I18NextOptions(
            formats: _formatters(),
            missingInterpolationHandler: _interpolationFallback,
          ),
        );

  static Object? _interpolationFallback(
    Object? value,
    InterpolationFormat format,
    Locale locale,
    I18NextOptions options,
  ) {
    if (value is DateTime) {
      try {
        return DateFormat(format.name, locale.toString()).format(value);
      } catch (error) {
        // TODO: track?
        return value.toString();
      }
    }
    return value;
  }

  static Map<String, ValueFormatter> _formatters() => {
        'uppercase': (value, format, locale, options) =>
            value?.toString().toUpperCase(),
        'lowercase': (value, format, locale, options) =>
            value?.toString().toLowerCase(),
        'capitalize': (value, format, locale, options) =>
            _capitalize(value?.toString()),
      };

  /// Capitalizes the first alphabetic character it finds
  static String? _capitalize(String? string) {
    return string?.replaceFirstMapped(
      RegExp('[a-zA-Z]'),
      (match) => match.group(0)?.toUpperCase() ?? '',
    );
  }
}
