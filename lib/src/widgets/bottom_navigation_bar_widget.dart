import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  void _changeView(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      Center(
        child: Text(_currentIndex.toString()),
      ),
      Center(
        child: Text(_currentIndex.toString()),
      ),
    ];

    return Scaffold(
      body: widgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeView,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.bottomNavigationBarHome,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.groups),
            label: AppLocalizations.of(context)!.bottomNavigationBarTeam,
          ),
        ],
      ),
    );
  }
}
