import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  // creating an empty list
  List todoList = [];

  // referencing the Hive box here
  final _myBox = Hive.box('mybox');

  // run the method if first time opening the app
  void initialData() {
    todoList = [
      ["Chant Hare Krishna", false],
    ];
  }

  // load the data from database
  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  // update the database
  void updateDataBase() {
    _myBox.put('TODOLIST', todoList);
  }

}