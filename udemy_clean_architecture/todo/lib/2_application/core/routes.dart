import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO - 88. 14:30
// final GlobalKey<NavigatorState> _rootNavigatorKey;

final routes = GoRouter(
  routes: [
    GoRoute(
        path: '/home/settings',
        builder: (context, state) {
          return Container(
            color: Colors.amber,
          );
        }),
    GoRoute(
        path: '/home/start',
        builder: (context, state) {
          return Container(
            color: Colors.blueGrey,
          );
        }),
  ],
);
