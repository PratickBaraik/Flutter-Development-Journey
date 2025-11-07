import 'package:hive/hive.dart';
import '../models/todo_model.dart';

class TodoLocalDataSource {
  final Box<TodoModel> box;

  TodoLocalDataSource(this.box);

  List<TodoModel> load() => box.values.toList();

  Future<void> save(TodoModel m) => box.put(m.id, m);

  Future<void> delete(String id) => box.delete(id);
}
