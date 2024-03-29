import 'package:go_router/go_router.dart';
import 'package:todo/1_domain/entities/todo_collection.dart';
import 'package:flutter/material.dart';
import 'package:todo/2_application/pages/detail/todo_detail_page.dart';

class ToDoOverviewLoaded extends StatelessWidget {
  const ToDoOverviewLoaded({
    super.key,
    required this.collections,
  });

  final List<ToDoCollection> collections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: collections.length,
        itemBuilder: (context, index) {
          final item = collections[index];
          final colorScheme = Theme.of(context).colorScheme;

          return ListTile(
            tileColor: colorScheme.surface,
            selectedTileColor: colorScheme.surfaceVariant,
            iconColor: item.color.color,
            selectedColor: item.color.color,
            onTap: () => context.pushNamed(ToDoDetailPage.pageConfig.name,
                params: {'collectionId': item.id.value}),
            leading: const Icon(Icons.circle),
            title: Text(item.title),
          );
        });
  }
}
