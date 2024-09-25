import 'package:flutter/material.dart';
import 'package:flutter_demo11_todo_app/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../utils/todo_tile.dart';
import '../utils/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // the initial stage of the app
  @override
  void initState() {

    // if first time open app, create default data
    if(_myBox.get('TODOLIST') == null) {
      db.initialData();
    } else {
      // data already exists
      db.loadData();
    }

    super.initState();
  }

  // referencing the hive box
  final _myBox = Hive.box('mybox');

  // instance of ToDoDataBase class
  ToDoDataBase db = ToDoDataBase();

  // text controller
  final _controller = TextEditingController();

  // checkbox changed method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });

    // if check box changed
    db.updateDataBase();
  }

  // save new task function / method
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });

    Navigator.of(context).pop();

    // updating the database
    db.updateDataBase();
  }

  // creating new task function
  void createNewTask() {
    showDialog (
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
  }

  // delete task function
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });

    // updating the database
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: const Text(
          'TO DO App',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton (
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
        ),
      ),

      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
