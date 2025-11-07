import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/todo_local_ds.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/add_todo.dart';
import '../../domain/usecases/toggle_todo.dart';
import '../../domain/usecases/delete_todo.dart';
import 'todo_controller.dart';
import 'package:hive/hive.dart';
import '../../data/models/todo_model.dart';

final todoBoxProvider = Provider<Box<TodoModel>>((ref) {
  return Hive.box<TodoModel>('todos');
});

final todoRepoProvider = Provider((ref) {
  return TodoRepositoryImpl(TodoLocalDataSource(ref.watch(todoBoxProvider)));
});

final todoControllerProvider =
    StateNotifierProvider<TodoController, List<TodoEntity>>((ref) {
  final repo = ref.watch(todoRepoProvider);
  return TodoController(
    getTodos: GetTodos(repo),
    addTodo: AddTodo(repo),
    toggleTodo: ToggleTodo(repo),
    deleteTodo: DeleteTodo(repo),
  );
});
