import 'package:flutter/material.dart';

/// Defines the typography styles used throughout the app
class AppTypography {
  // Typography scale as required: 12, 14, 16, 20, 24
  static const double caption = 12.0;
  static const double body = 14.0;
  static const double subtitle = 16.0;
  static const double title = 20.0;
  static const double headline = 24.0;

  // Default font family
  static const String fontFamily = 'Roboto';

  // Create TextStyle instances
  static TextStyle createTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      decoration: decoration,
      fontFamily: fontFamily,
    );
  }
}
