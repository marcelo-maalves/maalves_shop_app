import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TColors extends Equatable {
  const TColors({
    required this.primaryMain,
    required this.primaryBlue,
    required this.secondaryMain,
    required this.purpleDark,
    required this.purpleNormal,
    required this.purpleLight,
    required this.purpleTransparent,
    required this.blueDark,
    required this.blueNormal,
    required this.blueLight,
    required this.blueTransparent,
    required this.blueOxford,
    required this.yellowDark,
    required this.yellowNormal,
    required this.yellowLight,
    required this.yellowTransparent,
    required this.neutralDark,
    required this.neutralNormal,
    required this.neutralLight,
    required this.neutralTransparent,
    required this.inputHintColor,
    required this.graySanRuan,
    required this.grayBermuda,
    required this.graySilver,
    required this.white,
  });

  factory TColors.light() => const TColors(
        primaryMain: Color(0xFF6800CF),
        primaryBlue: Color(0xFF50C8FB),
        secondaryMain: Color(0xFFFFC01F),
        purpleDark: Color(0xFF47008D),
        purpleNormal: Color(0xFF954CDD),
        purpleLight: Color(0xFFD1A4FF),
        purpleTransparent: Color(0xFFEFDFFF),
        blueDark: Color(0xFF0072A3),
        blueNormal: Color(0xFF42AAD7),
        blueLight: Color(0xFFCFF1FF),
        blueTransparent: Color(0xFFF5FCFF),
        blueOxford: Color(0xFF263238),
        yellowDark: Color(0xFFD19700),
        yellowNormal: Color(0xFFEDAE0B),
        yellowLight: Color(0xFFFFE39B),
        yellowTransparent: Color(0xFFFFF6DE),
        neutralDark: Color(0xFF728B97),
        neutralNormal: Color(0xFFE1E1E1),
        neutralLight: Color(0xFFF1F1F1),
        neutralTransparent: Color(0xFFF9F9F9),
        inputHintColor: Color(0xFFBDBDBD),
        graySanRuan: Color(0xFF455A64),
        grayBermuda: Color(0xFF728B97),
        graySilver: Color(0xFFBDBDBD),
        white: Color(0xFFFFFFFF),
      );

  final Color primaryMain;
  final Color primaryBlue;
  final Color secondaryMain;
  final Color purpleDark;
  final Color purpleNormal;
  final Color purpleLight;
  final Color purpleTransparent;
  final Color blueDark;
  final Color blueNormal;
  final Color blueLight;
  final Color blueTransparent;
  final Color blueOxford;
  final Color yellowDark;
  final Color yellowNormal;
  final Color yellowLight;
  final Color yellowTransparent;
  final Color neutralDark;
  final Color neutralNormal;
  final Color neutralLight;
  final Color neutralTransparent;
  final Color inputHintColor;
  final Color graySanRuan;
  final Color grayBermuda;
  final Color graySilver;
  final Color white;

  @override
  List get props => [
        primaryMain,
        primaryBlue,
        secondaryMain,
        purpleDark,
        purpleNormal,
        purpleLight,
        purpleTransparent,
        blueDark,
        blueNormal,
        blueLight,
        blueTransparent,
        blueOxford,
        yellowDark,
        yellowNormal,
        yellowLight,
        yellowTransparent,
        neutralDark,
        neutralNormal,
        neutralLight,
        neutralTransparent,
        inputHintColor,
        graySanRuan,
        grayBermuda,
        graySilver,
        white,
      ];
}

extension MaterialColorExt on Color {
  MaterialColor get swatch {
    final List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = red, g = green, b = blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(value, swatch);
  }
}
