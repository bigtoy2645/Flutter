import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/2_application/pages/dashboard.dart';
import 'package:todo/2_application/pages/detail/todo_detail_page.dart';
import 'package:todo/2_application/pages/overview/overview.dart';
import 'package:todo/2_application/pages/settings.dart';

import '../../1_domain/entities/unique_id.dart';
import '../pages/home.dart';
import 'go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "shell");

const _basePath = "/home";
const _startPath = "$_basePath/start";
final _settingsPath = "$_basePath/${SettingsPage.pageConfig.name}";

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "$_basePath/${DashboardPage.pageConfig.name}",
  // observers: [GoRouterObserver()],
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          name: HomePage.pageConfig.name,
          path: "$_basePath/:tab",
          builder: (context, state) => HomePage(
            key: state.pageKey,
            tab: state.params["tab"] ?? "",
          ),
        ),
        GoRoute(
          name: ToDoDetailPage.pageConfig.name,
          path: "$_basePath/overview/:collectionId",
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: const Text("details"),
              leading: BackButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.goNamed(HomePage.pageConfig.name,
                        params: {'tab': OverviewPage.pageConfig.name});
                  }
                },
              ),
            ),
            body: ToDoDetailPageProvider(
              collectionId: CollectionId.fromUniqueString(
                  state.params['collectionId'] ?? ''),
            ),
          ),
        ),
      ],
    ),
    GoRoute(
        name: SettingsPage.pageConfig.name,
        path: _settingsPath,
        builder: (context, state) {
          return Container(
            color: Colors.amber,
            child: Column(
              children: [
                ElevatedButton(
                  child: const Text("Go to start"),
                  onPressed: () => context.push(_startPath),
                ),
                TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.push(_startPath);
                    }
                  },
                  child: const Text("Go back"),
                ),
              ],
            ),
          );
        }),
    GoRoute(
        path: _startPath,
        builder: (context, state) {
          return Container(
            color: Colors.blueGrey,
            child: Column(
              children: [
                ElevatedButton(
                  child: const Text("Go to settings"),
                  onPressed: () => context.push(_settingsPath),
                ),
                TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.push(_settingsPath);
                    }
                  },
                  child: const Text("Go back"),
                ),
              ],
            ),
          );
        }),
  ],
);
