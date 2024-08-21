import 'package:flutter/material.dart';
import 'package:flutter_demo7/pages/first.dart'; 
import 'package:flutter_demo7/pages/home.dart';
import 'package:flutter_demo7/pages/settings.dart'; 



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: First(),
      routes: {
        '/home': (context) => Home(),
        '/settings': (context) => Settings(),
      },
    );
  }
}
