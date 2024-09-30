import 'package:flutter/material.dart';

import '../utils/spacings.dart';
import 'colors_theme.dart';
import 'typography_theme.dart';

abstract class TInputs {
  static InputDecorationTheme inputDecorationTheme(
    TTypography textTheme,
    TColors colorScheme,
  ) {
    return InputDecorationTheme(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(x2)),
      ),
      hintStyle: textTheme.titleSmall?.copyWith(
        color: colorScheme.inputHintColor,
      ),
    );
  }
}
