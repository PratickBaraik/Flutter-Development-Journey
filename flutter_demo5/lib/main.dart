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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo 5"),
        ),
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            // child 1
            Container(
              width: 300,
              height: 300,
              color: Colors.amber[700],
            ),
            // child 2
            Container(
              width: 200,
              height: 200,
              color: Colors.amber[500],
            ),
            // child 3
            Container(
              width: 100,
              height: 100,
              color: Colors.amber[300],
            )
          ],
        ),
      ),
    );
  }
}
