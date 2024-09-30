import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:i18next/i18next.dart';

/// Main localization interface.
///
/// All other localization files should implement it and use [of] to access it
mixin L10n {
  String t(
    String key, {
    Locale? locale,
    String? context,
    int? count,
    Map<String, Object>? variables,
  });

  /// Finds the current/closest localization mechanism in the widget tree if any
  ///
  /// Returns a fallback if [context] or the mechanism is null.
  static L10n of(BuildContext? context) {
    I18Next? instance;
    if (context != null) instance = I18Next.of(context);
    return instance != null ? _I18NextL10n(instance) : fallback;
  }

  static const fallback = _L10nFallback();
}

/// Base localization convenience class to implement [L10n] interface.
///
/// ```dart
/// class MyL10n extends BaseL10n {
///   const MyL10n._(L10n l10n): super(l10n);
///
///   String get title => t('namespace:my.title.key');
///
///   static MyL10n of(BuildContext? context) => MyL10n._(L10n.of(context));
/// }
/// ```
class BaseL10n implements L10n {
  const BaseL10n(this._l10n) : super();

  final L10n _l10n;

  @override
  String t(
    String key, {
    Locale? locale,
    String? context,
    int? count,
    Map<String, Object>? variables,
  }) =>
      _l10n.t(key,
          locale: locale, context: context, count: count, variables: variables);
}

/// This is a [I18Next] interface wrapper.
///
/// It is not supposed to be accessed directly (there's no reason to)
class _I18NextL10n implements L10n {
  const _I18NextL10n(this._l10n) : super();

  final I18Next _l10n;

  @override
  String t(
    String key, {
    Locale? locale,
    String? context,
    int? count,
    Map<String, Object>? variables,
  }) =>
      _l10n.t(key,
          locale: locale, context: context, count: count, variables: variables);
}

class _L10nFallback implements L10n {
  const _L10nFallback();

  @override
  String t(
    String key, {
    Locale? locale,
    String? context,
    int? count,
    Map<String, Object>? variables,
  }) {
    final convertedMap = variables?.map((key, value) {
      var _value = value;
      if (_value is DateTime) {
        _value = _value.toUtc().toIso8601String();
      }
      return MapEntry(key, _value);
    });
    return <String>[
      key,
      if (context != null) '$context',
      if (count != null) '$count',
      if (variables != null) '${jsonEncode(convertedMap)}',
    ].join(';');
  }
}
