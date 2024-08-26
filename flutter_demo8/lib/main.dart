import 'package:flutter/material.dart';
import 'package:flutter_demo8/pages/home.dart';
import 'package:flutter_demo8/pages/profile.dart';
import 'package:flutter_demo8/pages/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //keeps track of the current page to display
  int _selectedIndex = 0;

  //method which updates the index of pages
  void _navBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    //home
    HomePage(),

    //profile
    ProfilePage(),

    //settings
    SettingsPage()
  ];

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

        body: _pages[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navBottomBar,

          items: const [
            //home
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'HOME',
            ),

            //profile
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'PROFILE',
            ),

            //settings
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'SETTINGS',
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
