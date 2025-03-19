<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

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
