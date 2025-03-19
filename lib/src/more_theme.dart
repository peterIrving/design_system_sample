import 'package:flutter/material.dart';
import 'package:sample_design_system/sample_design_system.dart';

/// Defines the spacing values used throughout the app
class AppSpacing {
  // Spacing scale as required: 4, 8, 16, 24, 32
  /// xs: 4
  static const double xs = 4.0;

  /// sm: 8
  static const double sm = 8.0;

  /// md: 16
  static const double md = 16.0;

  /// lg: 24
  static const double lg = 24.0;

  ///xl: 32
  static const double xl = 32.0;
}

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

enum AppThemeMode { light, dark, highContrast }

/// Main class for managing app theming
class AppTheme {
  /// Light theme colors
  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF2196F3), // Blue
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFBBDEFB),
    onPrimaryContainer: Color(0xFF062C40),
    secondary: Color(0xFF4CAF50), // Green
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFCBE6CB),
    onSecondaryContainer: Color(0xFF0A3D0D),
    error: Color(0xFFB00020),
    onError: Colors.white,
    errorContainer: Color(0xFFFFDAD5),
    onErrorContainer: Color(0xFF410002),
    surface: Colors.white,
    onSurface: Color(0xFF1A1A1A),
    surfaceContainerHighest: Color(0xFFEEEEEE),
    onSurfaceVariant: Color(0xFF4A4A4A),
    outline: Color(0xFFBDBDBD),
    shadow: Color(0x33000000),
    inverseSurface: Color(0xFF1A1A1A),
    onInverseSurface: Colors.white,
    inversePrimary: Color(0xFF90CAF9),
    surfaceTint: Color(0xFF2196F3),
  );

  /// Dark theme colors
  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF90CAF9), // Light Blue
    onPrimary: Color(0xFF062C40),
    primaryContainer: Color(0xFF0A4C75),
    onPrimaryContainer: Color(0xFFCEE5FF),
    secondary: Color(0xFF81C784), // Light Green
    onSecondary: Color(0xFF0A3D0D),
    secondaryContainer: Color(0xFF1B5E20),
    onSecondaryContainer: Color(0xFFCEE8CE),
    error: Color(0xFFCF6679),
    onError: Color(0xFF000000),
    errorContainer: Color(0xFF8B0000),
    onErrorContainer: Color(0xFFFFDAD5),
    surface: Color(0xFF1E1E1E),
    onSurface: Color(0xFFEEEEEE),
    surfaceContainerHighest: Color(0xFF2C2C2C),
    onSurfaceVariant: Color(0xFFBDBDBD),
    outline: Color(0xFF757575),
    shadow: Color(0x33000000),
    inverseSurface: Colors.white,
    onInverseSurface: Color(0xFF121212),
    inversePrimary: Color(0xFF1976D2),
    surfaceTint: Color(0xFF90CAF9),
  );

  /// High contrast theme colors for accessibility
  static const ColorScheme _highContrastColorScheme =
      ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF000000), // Black
        onPrimary: Color(0xFFFFFFFF), // White
        primaryContainer: Color(0xFF000000),
        onPrimaryContainer: Color(0xFFFFFFFF),
        secondary: Color(0xFF000000), // Black
        onSecondary: Color(0xFFFFFFFF), // White
        secondaryContainer: Color(0xFF000000),
        onSecondaryContainer: Color(0xFFFFFFFF),
        error: Color(0xFFFF0000), // Pure Red
        onError: Color(0xFFFFFFFF), // White
        errorContainer: Color(0xFFFF0000),
        onErrorContainer: Color(0xFFFFFFFF),
        surface: Color(0xFFFFFFFF), // White
        onSurface: Color(0xFF000000), // Black
        surfaceContainerHighest: Color(0xFFEEEEEE),
        onSurfaceVariant: Color(0xFF000000),
        outline: Color(0xFF000000), // Black
        shadow: Colors.black,
        inverseSurface: Color(0xFF000000),
        onInverseSurface: Color(0xFFFFFFFF),
        inversePrimary: Color(0xFFFFFFFF),
        surfaceTint: Color(0xFF000000),
      );

  /// Returns the appropriate theme data based on the selected mode
  static ThemeData getThemeData(AppThemeMode mode) {
    final ColorScheme colorScheme = _getColorScheme(mode);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,

      // Apply typography
      textTheme: _getTextTheme(colorScheme),

      // Button themes
      elevatedButtonTheme: _getElevatedButtonTheme(
        colorScheme,
      ),
      outlinedButtonTheme: _getOutlinedButtonTheme(
        colorScheme,
      ),
      textButtonTheme: _getTextButtonTheme(colorScheme),

      // Chip theme
      // chipTheme: _getChipTheme(colorScheme),

      // Card theme
      cardTheme: CardTheme(
        color: colorScheme.surface,
        elevation: 1,
        margin: const EdgeInsets.all(AppSpacing.sm),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.sm,
          ),
        ),
      ),

      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.sm,
          ),
          borderSide: BorderSide(
            color: colorScheme.outline,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.sm,
          ),
          borderSide: BorderSide(
            color: colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.sm,
          ),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.sm,
          ),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
    );
  }

  /// Gets the color scheme based on the theme mode
  static ColorScheme _getColorScheme(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return _lightColorScheme;
      case AppThemeMode.dark:
        return _darkColorScheme;
      case AppThemeMode.highContrast:
        return _highContrastColorScheme;
    }
  }

  /// Creates a text theme based on the color scheme
  static TextTheme _getTextTheme(ColorScheme colorScheme) {
    final Color textColor = colorScheme.onSurface;

    return TextTheme(
      // Display styles
      displayLarge: AppTypography.createTextStyle(
        fontSize: AppTypography.headline,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      displayMedium: AppTypography.createTextStyle(
        fontSize: AppTypography.title,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      displaySmall: AppTypography.createTextStyle(
        fontSize: AppTypography.subtitle,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),

      // Headline styles
      headlineLarge: AppTypography.createTextStyle(
        fontSize: AppTypography.headline,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      headlineMedium: AppTypography.createTextStyle(
        fontSize: AppTypography.title,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      headlineSmall: AppTypography.createTextStyle(
        fontSize: AppTypography.subtitle,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),

      // Title styles
      titleLarge: AppTypography.createTextStyle(
        fontSize: AppTypography.subtitle,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleMedium: AppTypography.createTextStyle(
        fontSize: AppTypography.body,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleSmall: AppTypography.createTextStyle(
        fontSize: AppTypography.caption,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),

      // Body styles
      bodyLarge: AppTypography.createTextStyle(
        fontSize: AppTypography.subtitle,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodyMedium: AppTypography.createTextStyle(
        fontSize: AppTypography.body,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodySmall: AppTypography.createTextStyle(
        fontSize: AppTypography.caption,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),

      // Label styles
      labelLarge: AppTypography.createTextStyle(
        fontSize: AppTypography.body,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      labelMedium: AppTypography.createTextStyle(
        fontSize: AppTypography.caption,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      labelSmall: AppTypography.createTextStyle(
        fontSize: AppTypography.caption,
        fontWeight: FontWeight.normal,
        color: textColor.withValues(alpha: 0.7),
      ),
    );
  }

  /// Creates an elevated button theme based on the color scheme
  static ElevatedButtonThemeData _getElevatedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.sm,
          ),
        ),
        iconColor: colorScheme.onPrimary,
        elevation: 2,
        textStyle: AppTypography.createTextStyle(
          fontSize: AppTypography.body,
          fontWeight: FontWeight.w500,
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }

  /// Creates an outlined button theme based on the color scheme
  static OutlinedButtonThemeData _getOutlinedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.sm,
          ),
        ),
        side: BorderSide(color: colorScheme.primary),
        textStyle: AppTypography.createTextStyle(
          fontSize: AppTypography.body,
          fontWeight: FontWeight.w500,
          color: colorScheme.primary,
        ),
      ),
    );
  }

  /// Creates a text button theme based on the color scheme
  static TextButtonThemeData _getTextButtonTheme(
    ColorScheme colorScheme,
  ) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSpacing.sm,
          ),
        ),
        textStyle: AppTypography.createTextStyle(
          fontSize: AppTypography.body,
          fontWeight: FontWeight.w500,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}
