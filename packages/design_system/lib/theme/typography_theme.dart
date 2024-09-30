import 'package:flutter/material.dart';

import 'colors_theme.dart';

const dmSans = 'DM Sans';

class TTypography extends TextTheme {
  TTypography(TColors colorScheme)
      : headLine1 = TextStyle(
          color: colorScheme.blueOxford,
          fontFamily: dmSans,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        headLine2 = TextStyle(
          color: colorScheme.graySanRuan,
          fontFamily: dmSans,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        headLine3 = TextStyle(
          color: colorScheme.grayBermuda,
          fontFamily: dmSans,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        headLine4 = TextStyle(
          color: colorScheme.graySilver,
          fontFamily: dmSans,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        titleMediumBlack = TextStyle(
          color: colorScheme.blueOxford,
          fontFamily: dmSans,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        super(
          titleLarge: TextStyle(
            color: colorScheme.white,
            fontFamily: dmSans,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            color: colorScheme.white,
            fontFamily: dmSans,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        );

  final TextStyle headLine1;
  final TextStyle headLine2;
  final TextStyle headLine3;
  final TextStyle headLine4;
  final TextStyle titleMediumBlack;
}
