import 'package:flutter/material.dart';

import '../core/page_config.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  static const pageConfig = PageConfig(
    icon: Icons.work_history_rounded,
    name: "overview",
    child: OverviewPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: const Center(
        child: Text("Overview page"),
      ),
    );
  }
}
