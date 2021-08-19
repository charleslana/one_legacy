import 'package:flutter/material.dart';

class L10n {
  static const supportedLocales = [
    Locale('en'),
    Locale('es'),
    Locale('pt', 'BR'),
  ];

  static int getCountry(String code) {
    switch (code) {
      case 'en':
        return 1;
      case 'es':
        return 2;
      case 'pt':
        return 3;
      default:
        return 0;
    }
  }
}
