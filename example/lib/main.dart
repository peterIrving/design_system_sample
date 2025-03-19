import 'package:example/button_examples.dart';
import 'package:flutter/material.dart';
import 'package:sample_design_system/sample_design_system.dart';

void main() {
  runApp(ThemeCubitProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeConsumer(
      builder:
          (context, themeState) => MaterialApp(
            title: 'Flutter Demo',
            theme: themeState.themeData,

            home: Home(),
          ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("example app"),
        centerTitle: false,
        actions: [
          TextButton(
            child: Text(
              "theme: ${context.themeState.themeMode}",
            ),
            onPressed: () {
              context.themeCubit.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // Make the container take the full width
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xl,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...generateChipExamples(),
                ...textVariations(context),
                ButtonExamples(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> textVariations(BuildContext context) => [
  // Headline styles (24px)
  const SizedBox(height: 16),
  Container(
    padding: const EdgeInsets.all(8),
    color:
        Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest,
    width: double.infinity,
    child: const FreeportText(
      'Headline (24px)',
      variant: TextVariant.headline,
      bold: true,
    ),
  ),
  const SizedBox(height: 8),
  const FreeportText(
    'Normal headline text',
    variant: TextVariant.headline,
    bold: false,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Bold headline text',
    variant: TextVariant.headline,
    bold: true,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Italic headline text',
    variant: TextVariant.headline,
    italic: true,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Bold italic headline text',
    variant: TextVariant.headline,
    bold: true,
    italic: true,
  ),

  // Title styles (20px)
  const SizedBox(height: 16),
  Container(
    padding: const EdgeInsets.all(8),
    color:
        Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest,
    width: double.infinity,
    child: const FreeportText(
      'Title (20px)',
      variant: TextVariant.title,
      bold: true,
    ),
  ),
  const SizedBox(height: 8),
  const FreeportText(
    'Normal title text',
    variant: TextVariant.title,
    bold: false,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Bold title text',
    variant: TextVariant.title,
    bold: true,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Italic title text',
    variant: TextVariant.title,
    italic: true,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Bold italic title text',
    variant: TextVariant.title,
    bold: true,
    italic: true,
  ),

  // Subtitle styles (16px)
  const SizedBox(height: 16),
  Container(
    padding: const EdgeInsets.all(8),
    color:
        Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest,
    width: double.infinity,
    child: const FreeportText(
      'Subtitle (16px)',
      variant: TextVariant.subtitle,
      bold: true,
    ),
  ),
  const SizedBox(height: 8),
  const FreeportText(
    'Normal subtitle text',
    variant: TextVariant.subtitle,
    bold: false,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Bold subtitle text',
    variant: TextVariant.subtitle,
    bold: true,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Italic subtitle text',
    variant: TextVariant.subtitle,
    italic: true,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Bold italic subtitle text',
    variant: TextVariant.subtitle,
    bold: true,
    italic: true,
  ),

  // Body styles (14px)
  const SizedBox(height: 16),
  Container(
    padding: const EdgeInsets.all(8),
    color:
        Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest,
    width: double.infinity,
    child: const FreeportText(
      'Body (14px)',
      variant: TextVariant.body,
      bold: true,
    ),
  ),
  const SizedBox(height: 8),
  const FreeportText(
    'Normal body text. This is the standard text used for most of the content in the application. It should be highly readable and comfortable for extended reading.',
    variant: TextVariant.body,
    bold: false,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Bold body text. This is used to emphasize important information in body text.',
    variant: TextVariant.body,
    bold: true,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Italic body text. This is used for quotes, references, or to add subtle emphasis.',
    variant: TextVariant.body,
    italic: true,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Bold italic body text. This is used for strong emphasis in special cases.',
    variant: TextVariant.body,
    bold: true,
    italic: true,
  ),

  // Caption styles (12px)
  const SizedBox(height: 16),
  Container(
    padding: const EdgeInsets.all(8),
    color:
        Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest,
    width: double.infinity,
    child: const FreeportText(
      'Caption (12px)',
      variant: TextVariant.caption,
      bold: true,
    ),
  ),
  const SizedBox(height: 8),
  const FreeportText(
    'Normal caption text. Used for supplementary information, footnotes, and less important details.',
    variant: TextVariant.caption,
    bold: false,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Bold caption text. Used for emphasis in small text areas like labels and tags.',
    variant: TextVariant.caption,
    bold: true,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Italic caption text. Used for credits, citations, or subtle metadata.',
    variant: TextVariant.caption,
    italic: true,
  ),
  const SizedBox(height: 4),
  const FreeportText(
    'Bold italic caption text. Used for strong emphasis in captions.',
    variant: TextVariant.caption,
    bold: true,
    italic: true,
  ),

  // Color variations
  const SizedBox(height: 16),
  Container(
    padding: const EdgeInsets.all(8),
    color:
        Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest,
    width: double.infinity,
    child: const FreeportText(
      'Color Variations',
      variant: TextVariant.subtitle,
      bold: true,
    ),
  ),
  const SizedBox(height: 8),
  FreeportText(
    'Primary colored text',
    variant: TextVariant.body,
    color: Theme.of(context).colorScheme.primary,
  ),
  const SizedBox(height: 4),
  FreeportText(
    'Secondary colored text',
    variant: TextVariant.body,
    color: Theme.of(context).colorScheme.secondary,
  ),
  const SizedBox(height: 4),
  FreeportText(
    'Error colored text',
    variant: TextVariant.body,
    color: Theme.of(context).colorScheme.error,
  ),
];

/// Generates a list of widgets displaying all chip examples
List<Widget> generateChipExamples() {
  return [
    // Standard Chip Variants
    _buildSectionTitle('Standard Chip Variants'),
    const SizedBox(height: 8),
    _buildChipRow([
      const FreeportChip(
        label: 'Primary',
        variant: ChipVariant.primary,
      ),
      const FreeportChip(
        label: 'Secondary',
        variant: ChipVariant.secondary,
      ),
      const FreeportChip(
        label: 'Alert',
        variant: ChipVariant.alert,
      ),
      const FreeportChip(
        label: 'Info',
        variant: ChipVariant.info,
      ),
      const FreeportChip(
        label: 'Success',
        variant: ChipVariant.success,
      ),
    ]),

    const SizedBox(height: 24),

    // Selected Chips
    _buildSectionTitle('Selected State'),
    const SizedBox(height: 8),
    _buildChipRow([
      const FreeportChip(
        label: 'Primary',
        variant: ChipVariant.primary,
        isSelected: true,
      ),
      const FreeportChip(
        label: 'Secondary',
        variant: ChipVariant.secondary,
        isSelected: true,
      ),
      const FreeportChip(
        label: 'Alert',
        variant: ChipVariant.alert,
        isSelected: true,
      ),
      const FreeportChip(
        label: 'Info',
        variant: ChipVariant.info,
        isSelected: true,
      ),
      const FreeportChip(
        label: 'Success',
        variant: ChipVariant.success,
        isSelected: true,
      ),
    ]),

    const SizedBox(height: 24),

    // Disabled Chips
    _buildSectionTitle('Disabled State'),
    const SizedBox(height: 8),
    _buildChipRow([
      const FreeportChip(
        label: 'Primary',
        variant: ChipVariant.primary,
        isEnabled: false,
      ),
      const FreeportChip(
        label: 'Secondary',
        variant: ChipVariant.secondary,
        isEnabled: false,
      ),
      const FreeportChip(
        label: 'Alert',
        variant: ChipVariant.alert,
        isEnabled: false,
      ),
      const FreeportChip(
        label: 'Info',
        variant: ChipVariant.info,
        isEnabled: false,
      ),
      const FreeportChip(
        label: 'Success',
        variant: ChipVariant.success,
        isEnabled: false,
      ),
    ]),

    const SizedBox(height: 24),

    // Chips with Icons
    _buildSectionTitle('With Icons'),
    const SizedBox(height: 8),
    _buildChipRow([
      const FreeportChip(
        label: 'Primary',
        variant: ChipVariant.primary,
        icon: Icons.check_circle,
      ),
      const FreeportChip(
        label: 'Secondary',
        variant: ChipVariant.secondary,
        icon: Icons.star,
      ),
      const FreeportChip(
        label: 'Alert',
        variant: ChipVariant.alert,
        icon: Icons.warning,
      ),
      const FreeportChip(
        label: 'Info',
        variant: ChipVariant.info,
        icon: Icons.info,
      ),
      const FreeportChip(
        label: 'Success',
        variant: ChipVariant.success,
        icon: Icons.thumb_up,
      ),
    ]),

    const SizedBox(height: 24),

    // Deletable Chips
    _buildSectionTitle('Deletable Chips'),
    const SizedBox(height: 8),
    _buildChipRow([
      const FreeportChip(
        label: 'Primary',
        variant: ChipVariant.primary,
        deletable: true,
      ),
      const FreeportChip(
        label: 'Secondary',
        variant: ChipVariant.secondary,
        deletable: true,
      ),
      const FreeportChip(
        label: 'Alert',
        variant: ChipVariant.alert,
        deletable: true,
      ),
      const FreeportChip(
        label: 'Info',
        variant: ChipVariant.info,
        deletable: true,
      ),
      const FreeportChip(
        label: 'Success',
        variant: ChipVariant.success,
        deletable: true,
      ),
    ]),

    const SizedBox(height: 24),

    // Combined Features
    _buildSectionTitle('Combined Features'),
    const SizedBox(height: 8),
    _buildChipRow([
      const FreeportChip(
        label: 'Selected with icon',
        variant: ChipVariant.primary,
        isSelected: true,
        icon: Icons.check_circle,
      ),
      const FreeportChip(
        label: 'Deletable with icon',
        variant: ChipVariant.secondary,
        deletable: true,
        icon: Icons.star,
      ),
    ]),

    const SizedBox(height: 8),

    _buildChipRow([
      const FreeportChip(
        label: 'Selected & deletable',
        variant: ChipVariant.info,
        isSelected: true,
        deletable: true,
      ),
      const FreeportChip(
        label: 'All features',
        variant: ChipVariant.success,
        isSelected: true,
        deletable: true,
        icon: Icons.thumb_up,
      ),
    ]),
  ];
}

/// Helper method to build a section title
Widget _buildSectionTitle(String title) {
  return Builder(
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color:
              Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(
            AppSpacing.sm,
          ),
        ),
        child: FreeportText.subtitle(title, bold: true),
      );
    },
  );
}

/// Helper method to build a row of chips with proper spacing and wrapping
Widget _buildChipRow(List<Widget> chips) {
  return Wrap(
    spacing: AppSpacing.sm,
    runSpacing: AppSpacing.sm,
    children: chips,
  );
}
