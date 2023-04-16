import 'package:flutter/material.dart';

class ToDoOverviewLoading extends StatelessWidget {
  const ToDoOverviewLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive();
  }
}
