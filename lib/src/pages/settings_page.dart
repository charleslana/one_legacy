import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:one_legacy/src/providers/theme_provider.dart';
import 'package:one_legacy/src/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDefaultTheme;
  late bool _isDarkMode;

  void _selectDefaultTheme() {
    final ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false)..remove();

    themeProvider.brightness == Brightness.dark
        ? _isDarkMode = true
        : _isDarkMode = false;

    setState(() {
      _isDefaultTheme = true;
    });
  }

  void _toggleDarkMode(bool value) {
    Provider.of<ThemeProvider>(context, listen: false).toggle(isOn: value);

    setState(() {
      _isDefaultTheme = false;
      _isDarkMode = value;
    });
  }

  @override
  void initState() {
    final ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    setState(() {
      _isDefaultTheme = themeProvider.isDefaultTheme;
      _isDarkMode = themeProvider.isDarkMode;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: AppLocalizations.of(context)!.appBarSettings,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                AppLocalizations.of(context)!.pageSettingsTheme,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 30,
              ),
              CheckboxListTile(
                title: Text(
                    AppLocalizations.of(context)!.pageSettingsDefaultTheme),
                value: _isDefaultTheme,
                onChanged: (_) => _selectDefaultTheme(),
              ),
              SwitchListTile(
                title: Text(AppLocalizations.of(context)!.pageSettingsDarkMode),
                value: _isDarkMode,
                onChanged: _toggleDarkMode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
