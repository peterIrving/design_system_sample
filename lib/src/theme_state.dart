import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sample_design_system/sample_design_system.dart';

// Theme state class
class ThemeState {
  final AppThemeMode themeMode;
  final ThemeData themeData;

  ThemeState({
    required this.themeMode,
    required this.themeData,
  });
}

// Theme cubit
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(
        ThemeState(
          themeMode: AppThemeMode.light,
          themeData: AppTheme.getThemeData(
            AppThemeMode.light,
          ),
        ),
      );

  void setThemeMode(AppThemeMode mode) {
    emit(
      ThemeState(
        themeMode: mode,
        themeData: AppTheme.getThemeData(mode),
      ),
    );
  }

  void toggleTheme() {
    final newMode = switch (state.themeMode) {
      AppThemeMode.light => AppThemeMode.dark,
      AppThemeMode.dark => AppThemeMode.highContrast,
      AppThemeMode.highContrast => AppThemeMode.light,
    };

    setThemeMode(newMode);
  }
}

/// A widget that listens to [ThemeCubit] and rebuilds when theme changes
class ThemeConsumer extends StatelessWidget {
  /// The builder function that gets called when theme changes
  final Widget Function(
    BuildContext context,
    ThemeState state,
  )
  builder;

  const ThemeConsumer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: builder,
    );
  }
}

/// Provider widget to provide the ThemeCubit to the app
class ThemeCubitProvider extends StatelessWidget {
  final Widget child;
  final ThemeCubit? cubit;

  const ThemeCubitProvider({
    super.key,
    required this.child,
    this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => cubit ?? ThemeCubit(),
      child: child,
    );
  }
}

/// Extension method to easily access ThemeCubit from BuildContext
extension ThemeCubitExtension on BuildContext {
  ThemeCubit get themeCubit =>
      BlocProvider.of<ThemeCubit>(this);
  ThemeState get themeState => themeCubit.state;
}
