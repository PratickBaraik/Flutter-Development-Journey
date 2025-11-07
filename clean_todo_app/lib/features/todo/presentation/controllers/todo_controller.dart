import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/add_todo.dart';
import '../../domain/usecases/toggle_todo.dart';
import '../../domain/usecases/delete_todo.dart';
import 'dart:math';

class TodoController extends StateNotifier<List<TodoEntity>> {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final ToggleTodo toggleTodo;
  final DeleteTodo deleteTodo;

  TodoController({
    required this.getTodos,
    required this.addTodo,
    required this.toggleTodo,
    required this.deleteTodo,
  }) : super([]);

  Future<void> load() async {
    state = await getTodos();
  }

  Future<void> create(String title) async {
    final id = Random().nextInt(999999).toString();
    await addTodo(TodoEntity(id: id, title: title, done: false));
    await load();
  }

  Future<void> toggle(String id) async {
    await toggleTodo(id);
    await load();
  }

  Future<void> remove(String id) async {
    await deleteTodo(id);
    await load();
  }
}
