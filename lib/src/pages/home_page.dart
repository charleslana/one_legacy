import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:one_legacy/src/constants.dart';
import 'package:one_legacy/src/pages/home_team_page.dart';
import 'package:one_legacy/src/pages/home_units_page.dart';
import 'package:one_legacy/src/widgets/app_bar_widget.dart';
import 'package:one_legacy/src/widgets/bottom_navigation_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(
          appBarWidget: AppBarWidget(
            title: AppLocalizations.of(context)!.appBarHome,
          ),
          bottomNavigationBarItem: [
            BottomNavigationBarItem(
              icon: Image.asset(
                Constants.bottomNavigationBarUnits,
                height: 38,
              ),
              label: AppLocalizations.of(context)!.bottomNavigationBarHomeUnits,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Constants.bottomNavigationBarTeam,
                height: 38,
              ),
              label: AppLocalizations.of(context)!.bottomNavigationBarHomeTeam,
            ),
          ],
          widgets: const [
            HomeUnitsPage(),
            HomeTeamPage(),
          ],
        ),
      ),
    );
  }
}
