import 'package:flutter/material.dart';
import 'package:radio_app/core/theme/elevated_button_theme.dart';

import '../constants/colors.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: 'Poppins',
    textTheme: textTheme(),
    elevatedButtonTheme: elevatedButtonThemeData,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    titleLarge: TextStyle(
      fontSize: 26.0,
      letterSpacing: 6.0,
      fontWeight: FontWeight.w500,
      color: YColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 24.0,
      letterSpacing: 3.0,
      fontWeight: FontWeight.w500,
      color: YColors.whiteOpaque,
    ),
    titleSmall: TextStyle(
      fontSize: 24.0,
      letterSpacing: 2.5,
      fontWeight: FontWeight.w400,
      color: YColors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: YColors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: YColors.accentOpaque,
    ),
    labelMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: YColors.accent,
    ),
  );
}
