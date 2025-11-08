import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/providers.dart';
import '../controllers/filter_provider.dart';
import '../controllers/visible_todos_provider.dart';
import '../widgets/todo_item.dart';
import '../../../../core/theme/theme_mode_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final TextEditingController _searchCtrl;
  String query = '';

  @override
  void initState() {
    super.initState();
    _searchCtrl = TextEditingController();
    Future.microtask(
        () => ref.read(todoControllerProvider.notifier).load());
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(todoFilterProvider);
    final mode = ref.watch(themeModeProvider);

    final todos = ref
        .watch(visibleTodosProvider)
        .where((t) =>
            t.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
        actions: [
          IconButton(
            onPressed: () {
              final curr = ref.read(themeModeProvider);
              ref.read(themeModeProvider.notifier).state = switch (curr) {
                ThemeMode.system => ThemeMode.light,
                ThemeMode.light => ThemeMode.dark,
                ThemeMode.dark => ThemeMode.system,
              };
            },
            icon: Icon(
              switch (mode) {
                ThemeMode.system => Icons.brightness_auto,
                ThemeMode.light => Icons.light_mode,
                ThemeMode.dark => Icons.dark_mode,
              },
            ),
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: TextField(
                controller: _searchCtrl,
                onChanged: (v) => setState(() => query = v),
                decoration: InputDecoration(
                  hintText: 'Search tasks',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _searchCtrl.clear();
                            setState(() => query = '');
                          },
                        )
                      : null,
                ),
              ),
            ),
          ),

          // Filter Chips
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Wrap(
                spacing: 8,
                children: [
                  ChoiceChip(
                    key: const ValueKey("chip_all"),
                    label: const Text('All'),
                    selected: filter == TodoFilter.all,
                    onSelected: (_) =>
                        ref.read(todoFilterProvider.notifier).state =
                            TodoFilter.all,
                  ),
                  ChoiceChip(
                    key: const ValueKey("chip_active"),
                    label: const Text('Active'),
                    selected: filter == TodoFilter.active,
                    onSelected: (_) =>
                        ref.read(todoFilterProvider.notifier).state =
                            TodoFilter.active,
                  ),
                  ChoiceChip(
                    key: const ValueKey("chip_completed"),
                    label: const Text('Completed'),
                    selected: filter == TodoFilter.completed,
                    onSelected: (_) =>
                        ref.read(todoFilterProvider.notifier).state =
                            TodoFilter.completed,
                  ),
                ],
              ),
            ),
          ),

          // No items
          if (todos.isEmpty)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: Text('No items. Add one.')),
            )
          else
            // List
            SliverList.builder(
              itemCount: todos.length,
              itemBuilder: (context, i) {
                final t = todos[i];
                return RepaintBoundary(
                  child: Dismissible(
                    key: Key('todo_${t.id}'),
                    background: _bg(context, true),
                    secondaryBackground: _bg(context, false),
                    onDismissed: (_) => ref
                        .read(todoControllerProvider.notifier)
                        .remove(t.id),
                    child: TodoItem(
                      todo: t,
                      onToggle: () => ref
                          .read(todoControllerProvider.notifier)
                          .toggle(t.id),
                      onDelete: () => ref
                          .read(todoControllerProvider.notifier)
                          .remove(t.id),
                    ),
                  ),
                );
              },
            ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Add'),
        onPressed: () => _openAddSheet(context),
      ),
    );
  }

  Widget _bg(BuildContext context, bool start) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      alignment: start ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: cs.errorContainer,
      child: Icon(Icons.delete, color: cs.onErrorContainer),
    );
  }

  Future<void> _openAddSheet(BuildContext context) async {
    final ctrl = TextEditingController();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (c) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(c).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Add Task',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              TextField(
                controller: ctrl,
                autofocus: true,
                decoration: const InputDecoration(hintText: 'Task title'),
                onSubmitted: (_) => _submit(ctrl),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () => _submit(ctrl),
                      child: const Text('Add'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(c),
                      child: const Text('Cancel'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _submit(TextEditingController ctrl) {
    final t = ctrl.text.trim();
    if (t.isEmpty) return;
    ref.read(todoControllerProvider.notifier).create(t);
    Navigator.pop(context);
  }
}
