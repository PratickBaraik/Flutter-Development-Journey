import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:18.0, left: 18.0, right: 18.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.amber[500],
          borderRadius: BorderRadius.circular(14)
        ),
        child: Row(
          children: [
            //checkbox
            Checkbox(
              value: taskCompleted,
              activeColor: Colors.amber[700],
              checkColor: Colors.white,
              // fillColor: Colors.amber[700],
              onChanged: onChanged,
            ),
            //task name
            Text(
              taskName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
