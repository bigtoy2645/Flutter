import 'package:flutter/material.dart';
import 'package:todo/2_application/core/page_config.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static const pageConfig = PageConfig(
    icon: Icons.dashboard_rounded,
    name: "dashboard",
    child: DashboardPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      child: const Center(
        child: Text("Dashboard page"),
      ),
    );
  }
}
