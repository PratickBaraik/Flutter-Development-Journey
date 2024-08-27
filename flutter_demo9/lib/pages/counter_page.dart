import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(
                Colors.white
            ),
          ),
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu_rounded, size: 32),
            onPressed: () {
              // Handle menu button press
            },
          ),
          title: const Text(
            'Demo 9',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_rounded, size: 32),
              onPressed: () {
                // Handle logout button press
              },
            ),
          ],
          backgroundColor: Colors.amber[700],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "You pushed the button this many times:",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                _counter.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                onPressed: _incrementCounter,
                style: ButtonStyle(
                  backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.amber[700]!),
                ),
                child: const Text(
                  '+',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}