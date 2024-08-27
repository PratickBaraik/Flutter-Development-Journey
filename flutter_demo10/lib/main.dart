import 'package:flutter/material.dart';
import 'package:flutter_demo10/pages/to_do_page.dart';

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
            foregroundColor: WidgetStateProperty.all<Color>(
              Colors.white,
            ),
          ),
        ),
      ),

      home: ToDoPage(),
    );
  }
}