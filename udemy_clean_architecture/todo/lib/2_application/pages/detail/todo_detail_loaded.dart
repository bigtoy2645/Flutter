import 'package:flutter/material.dart';
import 'package:todo/2_application/components/todo_entry_item.dart';

import '../../../1_domain/entities/unique_id.dart';

class ToDoDetailLoaded extends StatelessWidget {
  const ToDoDetailLoaded({
    super.key,
    required this.entryIds,
    required this.collectionId,
  });

  final List<EntryId> entryIds;
  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: entryIds.length,
        itemBuilder: (context, index) => ToDoEntryItemProvider(
          collectionId: collectionId,
          entryId: entryIds[index],
        ),
      ),
    ));
  }
}
