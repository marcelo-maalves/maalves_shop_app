import 'package:flutter/material.dart';

import '../utils/spacings.dart';
import 'colors_theme.dart';

abstract class TButtons {
  static OutlinedButtonThemeData outlinedButtonTheme(TColors colorScheme) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: colorScheme.primaryBlue),
          shape: const StadiumBorder(),
          minimumSize: const Size(x0, x12),
        ),
      );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      minimumSize: const Size(x0, x12),
    ),
  );

  static final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: const StadiumBorder(),
      minimumSize: const Size(x0, x12),
    ),
  );
}

class TButtonTheme {
  TButtonTheme(
    TColors colorScheme, {
    ButtonStyle? elevatedWhiteButton,
  });
}
