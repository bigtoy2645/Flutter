import 'package:flutter/material.dart';

class ToDoDetailError extends StatelessWidget {
  const ToDoDetailError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Text("Error on detail page, please try again"),
    );
  }
}
