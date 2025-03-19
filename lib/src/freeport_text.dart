import 'package:flutter/material.dart';
import 'package:sample_design_system/src/app_typography.dart';

/// Defines the available text variants for [FreeportText]
enum TextVariant {
  /// Headline style (24px)
  headline,

  /// Title style (20px)
  title,

  /// Subtitle style (16px)
  subtitle,

  /// Body style (14px)
  body,

  /// Caption style (12px)
  caption,
}

/// A customized text widget that automatically uses the predefined styles
/// defined in AppTypography and the current theme.
class FreeportText extends StatelessWidget {
  /// The text to display
  final String text;

  /// The style variant of the text
  final TextVariant variant;

  /// Optional color override
  final Color? color;

  /// Whether the text should be bold
  final bool bold;

  /// Whether the text should be italic
  final bool italic;

  /// Text alignment
  final TextAlign? textAlign;

  /// Maximum number of lines
  final int? maxLines;

  /// Text overflow behavior
  final TextOverflow? overflow;

  /// Creates a [FreeportText] widget
  const FreeportText(
    this.text, {
    super.key,
    this.variant = TextVariant.body,
    this.color,
    this.bold = false,
    this.italic = false,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  /// Headline variant constructor
  factory FreeportText.headline(
    String text, {
    Key? key,
    Color? color,
    bool bold = true,
    bool italic = false,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FreeportText(
      text,
      key: key,
      variant: TextVariant.headline,
      color: color,
      bold: bold,
      italic: italic,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Title variant constructor
  factory FreeportText.title(
    String text, {
    Key? key,
    Color? color,
    bool bold = true,
    bool italic = false,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FreeportText(
      text,
      key: key,
      variant: TextVariant.title,
      color: color,
      bold: bold,
      italic: italic,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Subtitle variant constructor
  factory FreeportText.subtitle(
    String text, {
    Key? key,
    Color? color,
    bool bold = false,
    bool italic = false,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FreeportText(
      text,
      key: key,
      variant: TextVariant.subtitle,
      color: color,
      bold: bold,
      italic: italic,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Body variant constructor
  factory FreeportText.body(
    String text, {
    Key? key,
    Color? color,
    bool bold = false,
    bool italic = false,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FreeportText(
      text,
      key: key,
      variant: TextVariant.body,
      color: color,
      bold: bold,
      italic: italic,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Caption variant constructor
  factory FreeportText.caption(
    String text, {
    Key? key,
    Color? color,
    bool bold = false,
    bool italic = false,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FreeportText(
      text,
      key: key,
      variant: TextVariant.caption,
      color: color,
      bold: bold,
      italic: italic,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the current theme - this makes the text responsive to theme changes
    final ThemeData theme = Theme.of(context);

    // Create the base text style using AppTypography
    TextStyle style = _createBaseStyle(
      theme.colorScheme.onSurface,
    );

    // Apply modifiers (bold, italic, color)
    style = _applyModifiers(style, theme);

    // Create the text widget with the calculated style
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Creates the base text style using AppTypography instead of theme.textTheme
  TextStyle _createBaseStyle(Color textColor) {
    // Determine font size based on variant
    double fontSize;
    FontWeight defaultWeight;

    switch (variant) {
      case TextVariant.headline:
        fontSize = AppTypography.headline;
        defaultWeight = FontWeight.w600;
        break;
      case TextVariant.title:
        fontSize = AppTypography.title;
        defaultWeight = FontWeight.w600;
        break;
      case TextVariant.subtitle:
        fontSize = AppTypography.subtitle;
        defaultWeight = FontWeight.w500;
        break;
      case TextVariant.body:
        fontSize = AppTypography.body;
        defaultWeight = FontWeight.normal;
        break;
      case TextVariant.caption:
        fontSize = AppTypography.caption;
        defaultWeight = FontWeight.normal;
        break;
    }

    // Create text style using AppTypography's createTextStyle method
    return AppTypography.createTextStyle(
      fontSize: fontSize,
      fontWeight: defaultWeight,
      color: textColor,
    );
  }

  /// Applies modifiers (bold, italic, color) to the base style
  TextStyle _applyModifiers(
    TextStyle style,
    ThemeData theme,
  ) {
    // Apply bold
    if (bold) {
      style = style.copyWith(fontWeight: FontWeight.bold);
    }

    // Apply italic
    if (italic) {
      style = style.copyWith(fontStyle: FontStyle.italic);
    }

    // Apply color override if provided
    if (color != null) {
      style = style.copyWith(color: color);
    }

    return style;
  }
}
