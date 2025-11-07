import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Todo')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (c, i) {
          final t = todos[i];
          return ListTile(
            title: Text(t.title),
            leading: Checkbox(
              value: t.done,
              onChanged: (_) => ref.read(todoControllerProvider.notifier).toggle(t.id),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => ref.read(todoControllerProvider.notifier).remove(t.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final text = await showDialog<String>(
            context: context,
            builder: (c) {
              final ctrl = TextEditingController();
              return AlertDialog(
                title: const Text('Add Todo'),
                content: TextField(controller: ctrl),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(c, null),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(c, ctrl.text),
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );

          if (text != null && text.trim().isNotEmpty) {
            ref.read(todoControllerProvider.notifier).create(text.trim());
          }
        },
      ),
    );
  }
}
