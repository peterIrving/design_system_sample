## Example App

Within this repository, you will find a sample app that uses this plugin. It displays chips, text and buttons. The chips and text are styled via the widgets that are exported. 

The Buttons are styled via the theme directly. This allows theming to be applied directly to flutter widgets as an alternate to maintaining UI widgets in the plugin. Both can work.

I will say that the chips are not styled to my satisfaction but I wanted to submit this ASAP.

## Thought process

The biggest decision I made was whether to use the darkTheme, lightTheme parameters to the flutter app or use a custom solution to manage the state of the theme. Since there isn't a parameter for highContrastTheme, I decided to use my own state manager and supply the currently selected theme state to the default theme: parameter. This allows for an unlimited amount of themes and relies less on the flutter framework and I think would avoid breaking changes.

I did use a lot of code gen for this project and Ill say the results arent perfect but I am happy with the progress. I feel like the Text and Chip widgets are a bit verbose and could possibly be trimmed down. 

## Usage

To use this package, you should be able to add the repo to your flutter project by adding this as a dependency in your pubspec.yaml

```yaml
sample_design_system:
    git:
      url: https://github.com/peterIrving/design_system_sample.git
      ref: main
```

To use, wrap your app in the `ThemeCubitProvider` and then wrap the MaterialApp with the `ThemeConsumer`. Supply the themeState.themeData to the apps theme and you are good to go


```dart
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
```

To toggle light, dark and high contrast modes from anywhere in the app, use `context.themeCubit.toggleTheme();` to cycle through or `context.themeCubit. setThemeMode(AppThemeMode mode);` to set directly
