import 'package:flutter/material.dart';

class ToDoOverviewError extends StatelessWidget {
  const ToDoOverviewError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Text("ERROR, please try again"),
    );
  }
}
