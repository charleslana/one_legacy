import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider({required SharedPreferences? sharedPreferences}) {
    final bool? isDarkMode = sharedPreferences!.getBool('sharedDarkMode');

    if (isDarkMode == null) {
      _brightness == Brightness.dark
          ? themeMode = ThemeMode.dark
          : themeMode = ThemeMode.light;
    } else {
      isDarkMode ? themeMode = ThemeMode.dark : themeMode = ThemeMode.light;
    }
  }

  ThemeMode themeMode = ThemeMode.system;
  final _brightness = MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
      .platformBrightness;
}

final lighTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.orangeAccent,
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.orangeAccent,
  ),
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: Colors.orangeAccent,
  colorScheme: const ColorScheme.dark().copyWith(
    primary: Colors.orangeAccent,
  ),
);
