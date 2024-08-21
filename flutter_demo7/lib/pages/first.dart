// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Demo 7",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              // color: Colors.white,
            ),
          ),
          backgroundColor: Colors.amber[700],
        ),
        drawer: Drawer(
          backgroundColor: Colors.amber[300],
          child: Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.favorite_border_rounded,
                  size: 50,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  size: 40,
                  color: Colors.black,
                ),
                title: Text(
                  "H O M E",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  size: 40,
                  color: Colors.black,
                ),
                title: Text(
                  "S E T T I N G S",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.login_rounded,
                  size: 40,
                  color: Colors.black,
                ),
                title: Text(
                  "L O G O U T",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.amber[700],
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  "First Page",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
