import 'package:flutter/material.dart';
import 'package:flutter_demo8/pages/home.dart';
import 'package:flutter_demo8/pages/profile.dart';
import 'package:flutter_demo8/pages/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
