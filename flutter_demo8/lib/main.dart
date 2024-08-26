import 'package:flutter/material.dart';
import 'package:flutter_demo8/pages/home.dart';
import 'package:flutter_demo8/pages/settings.dart';
import 'package:flutter_demo8/pages/profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // selected index
  int _selectedIndex = 0;

  // method that updates the new selected index
  void _navBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // list of pages
  final List _pages = const [
    // home page
    HomePage(),

    // profile page
    ProfilePage(),

    // settings page
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      home: Scaffold(

        appBar: AppBar(

          leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ),

          title: const Text(
              "Demo 8",
          ),

          centerTitle: true,

          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.logout_rounded),
            ),
          ],

          iconTheme: const IconThemeData(
            color: Colors.white,
          ),

          backgroundColor: Colors.amber[700],
        ),

        body: _pages[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(

          currentIndex: _selectedIndex,
          onTap: _navBottomBar,
          items: const [
            //home
            BottomNavigationBarItem(
              icon: Icon(Icons.home),

              label: "HOME",
            ),

            //profile
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),

            //settings
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
            ),

          ],

          selectedItemColor: Colors.white,

          unselectedItemColor: Colors.black,

          backgroundColor: Colors.amber[700],
        ),
      ),
    );
  }
}