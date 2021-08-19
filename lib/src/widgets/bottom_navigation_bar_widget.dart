import 'package:flutter/material.dart';
import 'package:one_legacy/src/widgets/app_bar_widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    required this.widgets,
    required this.bottomNavigationBarItem,
    required this.appBarWidget,
    Key? key,
  }) : super(key: key);

  final List<Widget> widgets;
  final List<BottomNavigationBarItem> bottomNavigationBarItem;
  final AppBarWidget appBarWidget;

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
    return Scaffold(
      appBar: widget.appBarWidget,
      body: widget.widgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeView,
        items: widget.bottomNavigationBarItem,
      ),
    );
  }
}
