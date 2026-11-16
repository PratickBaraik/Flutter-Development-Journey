import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedAlignExampleApp extends StatelessWidget {
  const AnimatedAlignExampleApp({super.key});

  static const Duration duration = Duration(seconds: 2);
  static const Curve curve = Curves.fastLinearToSlowEaseIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('AnimatedAlign Sample')),
        body: const AnimatedAlignExample(duration: duration, curve: curve),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({
    required this.duration,
    required this.curve,
    super.key,
  });

  final Duration duration;
  final Curve curve;

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  final Random random = Random();

  Alignment alignment = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Generate random X and Y alignment values.
          alignment = Alignment(
            random.nextDouble() * 2 - 1,
            random.nextDouble() * 2 - 1,
          );
        });
      },
      child: Center(
        child: Container(
          width: 250.0,
          height: 250.0,
          color: Colors.black,
          child: AnimatedAlign(
            alignment: alignment,
            duration: widget.duration,
            curve: widget.curve,
            child: const FlutterLogo(size: 50.0),
          ),
        ),
      ),
    );
  }
}
