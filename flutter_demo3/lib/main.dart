// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List friends = [
    "Tushar",
    "Swapnil",
    "Aritra",
    "Dhruval",
    "Harsh",
    "Deepak",
    "Pranav"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[700],
          leading: const Icon(
            Icons.menu_rounded,
            size: 35,
            color: Colors.white,
          ),
          title: const Text(
            "Demo 3",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: const [
            Icon(
              size: 35,
              Icons.logout_rounded,
              color: Colors.white,
            ),
          ],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: friends.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(friends[index]),
            ),
          ),
        ),
      ),
    );
  }
}