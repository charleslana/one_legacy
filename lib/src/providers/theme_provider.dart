import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
}

final lighTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.orangeAccent,
  ),
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  colorScheme: const ColorScheme.dark().copyWith(
    primary: Colors.orangeAccent,
  ),
);
