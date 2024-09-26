import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:18.0, left: 18.0, right: 18.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(14),
            ),
          ],
        ),
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
                activeColor: Colors.black,
                checkColor: Colors.white,
                // fillColor: Colors.amber[700],
                onChanged: onChanged,
              ),
              //task name
              Flexible(
                child: Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 16,
                    decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
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
