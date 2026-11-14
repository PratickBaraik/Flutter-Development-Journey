import 'package:flutter/material.dart';

void main() {
  // runApp(MyApp());
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App', // used by the OS task switcher
      home: SafeArea(child: MyScaffold()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo 1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Demo 1')),
        body: Center(
          child: Text(
            'Hello, Flutter!',
            style: TextStyle(color: Colors.blue),
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  // fields in a widget subclass are always marked "final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // row is a horizontal, linear layout.
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // expanded expands its child
          // to fill the available space
          Expanded(child: title),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null, // null disables the button
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      // column is a vertical, linear layout
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example Title',
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
          const Expanded(child: Center(child: Text('Hello, World!'))),
        ],
      ),
    );
  }
}
