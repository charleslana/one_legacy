import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:one_legacy/src/l10n/l10n.dart';
import 'package:one_legacy/src/pages/home_page.dart';
import 'package:one_legacy/src/providers/locale_provider.dart';
import 'package:one_legacy/src/providers/theme_provider.dart';
import 'package:one_legacy/src/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  const MyApp({this.sharedPreferences, Key? key}) : super(key: key);

  final SharedPreferences? sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(sharedPreferences),
        ),
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(sharedPreferences),
        ),
      ],
      child: const MyAppMaterial(),
    );
  }
}

class MyAppMaterial extends StatelessWidget {
  const MyAppMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One Legacy',
      themeMode: themeProvider.themeMode,
      theme: lighTheme,
      darkTheme: darkTheme,
      locale: localeProvider.locale,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: Routes.home,
      routes: {
        Routes.home: (_) => const HomePage(),
      },
    );
  }
}
