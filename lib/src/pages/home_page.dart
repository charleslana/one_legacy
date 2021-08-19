import 'package:flutter/material.dart';
import 'package:one_legacy/src/widgets/bottom_navigation_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}
