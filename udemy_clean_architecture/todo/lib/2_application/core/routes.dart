import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home.dart';
import 'go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "shell");

const routeHome = "/home";
const routeStart = "/home/start";
const routeSettings = "/home/settings";

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: routeHome,
  // observers: [GoRouterObserver()],
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          path: "/home/:tab",
          builder: (context, state) => HomePage(
            key: state.pageKey,
            tab: state.params["tab"] ?? "",
          ),
        )
      ],
    ),
    GoRoute(
        path: routeSettings,
        builder: (context, state) {
          return Container(
            color: Colors.amber,
            child: Column(
              children: [
                ElevatedButton(
                  child: const Text("Go to start"),
                  onPressed: () => context.push(routeStart),
                ),
                TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.push(routeStart);
                    }
                  },
                  child: const Text("Go back"),
                ),
              ],
            ),
          );
        }),
    GoRoute(
        path: routeStart,
        builder: (context, state) {
          return Container(
            color: Colors.blueGrey,
            child: Column(
              children: [
                ElevatedButton(
                  child: const Text("Go to settings"),
                  onPressed: () => context.push(routeSettings),
                ),
                TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.push(routeSettings);
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
