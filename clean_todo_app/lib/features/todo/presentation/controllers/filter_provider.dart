import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TodoFilter { all, active, completed }

final todoFilterProvider =
    StateProvider<TodoFilter>((ref) => TodoFilter.all);
