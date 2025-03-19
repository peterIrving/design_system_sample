import 'package:flutter/material.dart';

/// Defines the visual variations available for [FreeportChip]
enum ChipVariant {
  /// Primary style chip, using primaryContainer colors
  primary,

  /// Secondary style chip, using secondaryContainer colors
  secondary,

  /// Alert style chip, using errorContainer colors
  alert,

  /// Info style chip, using surfaceVariant colors
  info,

  /// Success style chip, using success colors (green tones)
  success,
}

/// A custom chip widget with multiple style variations
/// that adapts to the current theme.
class FreeportChip extends StatelessWidget {
  /// The label text displayed inside the chip
  final String label;

  /// Optional icon to display before the label
  final IconData? icon;

  /// The style variant of the chip
  final ChipVariant variant;

  /// Whether the chip can be deleted
  final bool deletable;

  /// Callback when the delete button is tapped
  final VoidCallback? onDeleted;

  /// Callback when the chip is tapped
  final VoidCallback? onTap;

  /// Whether the chip is selected
  final bool isSelected;

  /// Whether the chip is enabled
  final bool isEnabled;

  /// Creates a [FreeportChip]
  const FreeportChip({
    super.key,
    required this.label,
    this.icon,
    this.variant = ChipVariant.primary,
    this.deletable = false,
    this.onDeleted,
    this.onTap,
    this.isSelected = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    // Get the current theme - this is what makes the chip
    // responsive to theme changes in the parent app
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine chip colors based on variant
    final ChipColors colors = _getChipColors(colorScheme);

    // Define text style
    final TextStyle labelStyle =
        theme.textTheme.labelMedium?.copyWith(
          color:
              isSelected
                  ? colors.selectedLabelColor
                  : colors.labelColor,
          fontWeight:
              isSelected
                  ? FontWeight.w500
                  : FontWeight.normal,
        ) ??
        TextStyle(
          fontSize: 14,
          fontWeight:
              isSelected
                  ? FontWeight.w500
                  : FontWeight.normal,
          color:
              isSelected
                  ? colors.selectedLabelColor
                  : colors.labelColor,
        );

    // Set up full styling for the chip
    return RawChip(
      label: Text(label, style: labelStyle),
      avatar:
          icon != null
              ? Icon(
                icon,
                size: 16,
                color:
                    isSelected
                        ? colors.selectedLabelColor
                        : colors.labelColor,
              )
              : null,
      backgroundColor: colors.backgroundColor,
      selectedColor: colors.selectedColor,
      disabledColor: colors.disabledColor,
      deleteIcon: const Icon(Icons.cancel, size: 16),
      deleteIconColor: colors.labelColor,
      onDeleted: deletable ? onDeleted : null,
      onPressed: isEnabled ? onTap : null,
      selected: isSelected,
      isEnabled: isEnabled,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
          color:
              isSelected
                  ? colors.selectedBorderColor
                  : colors.borderColor,
          width: 1.0,
        ),
      ),
      elevation: 0,
      pressElevation: 1,
      showCheckmark: false, // Disable default checkmark
      materialTapTargetSize:
          MaterialTapTargetSize.shrinkWrap,
      clipBehavior: Clip.antiAlias,
      visualDensity: VisualDensity.compact,
      shadowColor: Colors.transparent, // Disable shadow
    );
  }

  /// Determines the appropriate colors for the chip based on the variant and theme
  ChipColors _getChipColors(ColorScheme colorScheme) {
    switch (variant) {
      case ChipVariant.primary:
        return ChipColors(
          backgroundColor: colorScheme.primaryContainer
              .withValues(alpha: 0.7),
          selectedColor: colorScheme.primaryContainer,
          disabledColor: colorScheme.primaryContainer
              .withValues(alpha: 0.3),
          labelColor: colorScheme.onPrimaryContainer,
          selectedLabelColor:
              colorScheme.onPrimaryContainer,
          borderColor: colorScheme.primaryContainer,
          selectedBorderColor: colorScheme.primary,
        );

      case ChipVariant.secondary:
        return ChipColors(
          backgroundColor: colorScheme.secondaryContainer
              .withValues(alpha: 0.7),
          selectedColor: colorScheme.secondaryContainer,
          disabledColor: colorScheme.secondaryContainer
              .withValues(alpha: 0.3),
          labelColor: colorScheme.onSecondaryContainer,
          selectedLabelColor:
              colorScheme.onSecondaryContainer,
          borderColor: colorScheme.secondaryContainer,
          selectedBorderColor: colorScheme.secondary,
        );

      case ChipVariant.alert:
        return ChipColors(
          backgroundColor: colorScheme.errorContainer
              .withValues(alpha: 0.7),
          selectedColor: colorScheme.errorContainer,
          disabledColor: colorScheme.errorContainer
              .withValues(alpha: 0.3),
          labelColor: colorScheme.onErrorContainer,
          selectedLabelColor: colorScheme.onErrorContainer,
          borderColor: colorScheme.errorContainer,
          selectedBorderColor: colorScheme.error,
        );

      case ChipVariant.info:
        // Using surfaceVariant as a fallback if surfaceContainerHighest isn't available
        final backgroundColor =
            colorScheme.surfaceContainerHighest;

        return ChipColors(
          backgroundColor: backgroundColor.withValues(
            alpha: 0.7,
          ),
          selectedColor: backgroundColor,
          disabledColor: backgroundColor.withValues(
            alpha: 0.3,
          ),
          labelColor: colorScheme.onSurfaceVariant,
          selectedLabelColor: colorScheme.onSurfaceVariant,
          borderColor: colorScheme.outlineVariant,
          selectedBorderColor: colorScheme.outline,
        );

      case ChipVariant.success:
        // For success, we're using a green color derived from the secondary color
        final Color successColor = _deriveSuccessColor(
          colorScheme,
        );

        return ChipColors(
          backgroundColor: successColor.withValues(
            alpha: 0.2,
          ),
          selectedColor: successColor.withValues(
            alpha: 0.3,
          ),
          disabledColor: successColor.withValues(
            alpha: 0.1,
          ),
          labelColor: successColor,
          selectedLabelColor: successColor,
          borderColor: successColor.withValues(alpha: 0.5),
          selectedBorderColor: successColor,
        );
    }
  }

  /// Helper method to derive a success color (green) based on the theme
  Color _deriveSuccessColor(ColorScheme colorScheme) {
    // Use a green color - if the theme already has a green secondary
    // it will be close to it, otherwise use a standard green
    if (colorScheme.brightness == Brightness.dark) {
      return const Color(
        0xFF4CAF50,
      ); // Lighter green for dark themes
    } else {
      return const Color(
        0xFF2E7D32,
      ); // Darker green for light themes
    }
  }
}

/// Helper class to store all the colors needed for a chip
class ChipColors {
  final Color backgroundColor;
  final Color selectedColor;
  final Color disabledColor;
  final Color labelColor;
  final Color selectedLabelColor;
  final Color borderColor;
  final Color selectedBorderColor;

  const ChipColors({
    required this.backgroundColor,
    required this.selectedColor,
    required this.disabledColor,
    required this.labelColor,
    required this.selectedLabelColor,
    required this.borderColor,
    required this.selectedBorderColor,
  });
}
