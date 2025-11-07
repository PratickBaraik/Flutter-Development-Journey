import 'package:hive/hive.dart';
import '../../domain/entities/todo_entity.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
    @HiveField(0)
    String id;

    @HiveField(1)
    String title;

    @HiveField(2)
    bool done;

    TodoModel({
        required this.id,
        required this.title,
        required this.done,
    });

    TodoEntity toEntity() {
        return TodoEntity(id: id, title: title, done: done);
    }

    static TodoModel fromEntity(TodoEntity e) {
        return TodoModel(id: e.id, title: e.title, done: e.done);
    }
}