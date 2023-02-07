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
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Basics"),
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.amber,
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'This is the First Column child - !!!!! Max width over !!!!',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        color: Colors.black,
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 8),
                      Container(
                        color: Colors.deepPurple,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  color: Colors.pink,
                  child: Text('Second Column child'),
                ),
                SizedBox(height: 30),
                Stack(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/snoopy_party.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Text(
                        'Snoopy!',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://picsum.photos/200"),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  color: Colors.tealAccent,
                  child: Text('Third Column child'),
                ),
                SizedBox(height: 30),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Hello World!",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(color: Colors.green, height: 300, child: Text('end')),
              ],
            ),
          );
        }),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              const snackBar = SnackBar(content: Text('Yay! A FAB SnackBar!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Icon(Icons.lightbulb),
          );
        }),
      ),
    );
  }
}
