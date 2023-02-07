import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Basics"),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: TextButton(
                onPressed: () {
                  const snackBar =
                      SnackBar(content: Text('Yay! A TextButton SnackBar!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text("Hello Snackbar")),
          );
        }),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              const snackBar = SnackBar(content: Text('Yay! A FAB SnackBar!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Icon(Icons.ac_unit),
          );
        }),
      ),
    );
  }
}
