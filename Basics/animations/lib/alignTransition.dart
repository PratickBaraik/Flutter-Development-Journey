import 'package:flutter/material.dart';

class AlignTransitionExampleApp extends StatelessWidget {
  const AlignTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AlignTransition Sample')),
      body: const AlignTransitionExample(),
    );
  }
}

class AlignTransitionExample extends StatefulWidget {
  const AlignTransitionExample({super.key});

  @override
  State<AlignTransitionExample> createState() => _AlignTransitionExampleState();
}

/// [AnimationController]s can be created with 'vsync: this' because of
/// [TickerProviderStateMixin].

class _AlignTransitionExampleState extends State<AlignTransitionExample>
    with TickerProviderStateMixin {
  // using 'late final' for lazy initialization

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.bottomLeft,
    end: Alignment.center,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.amberAccent,
      child: AlignTransition(
        alignment: _animation,
        child: const Padding(
          padding: .all(8.0),
          child: FlutterLogo(size: 150.0),
        ),
      ),
    );
  }
}
