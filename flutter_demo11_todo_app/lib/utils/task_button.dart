import 'package:flutter/material.dart';

class TaskButton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  TaskButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.amber[700],
      elevation: 0,
      child: Text(text)
    );
  }
}
