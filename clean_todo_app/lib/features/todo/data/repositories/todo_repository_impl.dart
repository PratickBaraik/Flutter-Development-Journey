import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_ds.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource ds;

  TodoRepositoryImpl(this.ds);

  @override
  Future<List<TodoEntity>> getTodos() async {
    return ds.load().map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> addTodo(TodoEntity todo) async {
    await ds.save(TodoModel.fromEntity(todo));
  }

  @override
  Future<void> deleteTodo(String id) async {
    await ds.delete(id);
  }

  @override
  Future<void> toggleStatus(String id) async {
    final list = ds.load();
    final item = list.firstWhere((x) => x.id == id);
    item.done = !item.done;
    await item.save();
  }
}
