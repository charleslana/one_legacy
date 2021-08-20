import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:one_legacy/src/l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider(SharedPreferences? sharedPreferences) {
    final String? sharedLocale = sharedPreferences!.getString('sharedLocale');
    final String languageCode = ui.window.locale.languageCode;
    final Iterable<Locale> supportedLocales =
        L10n.supportedLocales.where((locale) => locale == Locale(languageCode));

    if (sharedLocale == null) {
      supportedLocales.isNotEmpty
          ? locale = Locale(languageCode)
          : locale = const Locale('en');
    } else {
      locale = Locale(sharedLocale);
    }
  }

  late Locale locale;
}
