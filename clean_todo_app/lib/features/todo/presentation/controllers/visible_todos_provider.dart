import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/todo_entity.dart';
import 'providers.dart';
import 'filter_provider.dart';

final visibleTodosProvider = Provider<List<TodoEntity>>((ref) {
  final todos = ref.watch(todoControllerProvider);
  final filter = ref.watch(todoFilterProvider);

  switch (filter) {
    case TodoFilter.all:
      return todos;
    case TodoFilter.active:
      return todos.where((t) => !t.done).toList();
    case TodoFilter.completed:
      return todos.where((t) => t.done).toList();
  }
});
