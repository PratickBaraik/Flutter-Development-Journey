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
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white
            ),
          ),
        ),
      ),

      home: Scaffold(

        appBar: AppBar(

          leading: IconButton(
            iconSize: 32,
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {},
          ),

          title: const Text(
            'Demo 8',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),

          centerTitle: true,

          actions: [
            IconButton(
              iconSize: 32,
              icon: const Icon(Icons.logout_rounded),
              onPressed: () {},
            ),
          ],

          backgroundColor: Colors.amber[700],
        ),
      ),
    );
  }
}
