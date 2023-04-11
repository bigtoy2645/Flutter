import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/2_application/core/page_config.dart';
import 'package:todo/2_application/pages/dashboard.dart';
import 'package:todo/2_application/pages/overview.dart';
import 'package:todo/2_application/pages/settings.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required String tab,
  }) : index = tabs.indexWhere((element) => element.name == tab);

  final int index;

  static const pageConfig = PageConfig(icon: Icons.home_rounded, name: "home");
  static const tabs = [
    DashboardPage.pageConfig,
    OverviewPage.pageConfig,
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs.map(
      (page) => NavigationDestination(icon: Icon(page.icon), label: page.name));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key("primary-navigation-medium"),
              builder: (context) => AdaptiveScaffold.standardNavigationRail(
                trailing: IconButton(
                    onPressed: () =>
                        context.pushNamed(SettingsPage.pageConfig.name),
                    icon: Icon(SettingsPage.pageConfig.icon)),
                selectedLabelTextStyle:
                    TextStyle(color: theme.colorScheme.onBackground),
                selectedIconTheme:
                    IconThemeData(color: theme.colorScheme.onBackground),
                unselectedIconTheme: IconThemeData(
                    color: theme.colorScheme.onBackground.withOpacity(0.5)),
                onDestinationSelected: (index) =>
                    _tapOnNavigationDestination(context, index),
                selectedIndex: widget.index,
                destinations: destinations
                    .map((_) => AdaptiveScaffold.toRailDestination(_))
                    .toList(),
              ),
            ),
          }),
          bottomNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key("bottom-navigation-small"),
              builder: (context) => AdaptiveScaffold.standardNavigationRail(
                onDestinationSelected: (index) =>
                    _tapOnNavigationDestination(context, index),
                destinations: destinations
                    .map((_) => AdaptiveScaffold.toRailDestination(_))
                    .toList(),
              ),
            ),
          }),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key("primary-body-small"),
                builder: (_) => HomePage.tabs[widget.index].child,
              ),
            },
          ),
          secondaryBody: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key("secondary-body-medium"),
              builder: AdaptiveScaffold.emptyBuilder,
            )
          }),
        ),
      ),
    );
  }

  void _tapOnNavigationDestination(BuildContext context, int index) =>
      context.goNamed(HomePage.pageConfig.name,
          params: {'tab': HomePage.tabs[index].name});
}
