import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[700],
          leading: Icon(
            Icons.menu_rounded,
            size: 30,
            color: Colors.white,
          ),
          title: Text(
            "Demo 4",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          actions: [
            Icon(
              Icons.logout_rounded,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
        body: GridView.builder(
          itemCount: 36,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
          itemBuilder: (context, index) => Container(
            color: Colors.amber[500],
            margin: EdgeInsets.all(4),
          ),
        ),
      ),
    );
  }
}
