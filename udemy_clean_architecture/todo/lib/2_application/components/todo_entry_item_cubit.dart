import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/use_case.dart';

import '../../1_domain/entities/todo_entry.dart';
import '../../1_domain/entities/unique_id.dart';
import '../../1_domain/use_cases/load_todo_entry.dart';
import '../../1_domain/use_cases/update_todo_entry.dart';

part 'todo_entry_item_state.dart';

class ToDoEntryItemCubit extends Cubit<ToDoEntryItemState> {
  ToDoEntryItemCubit({
    required this.loadToDoEntry,
    required this.entryId,
    required this.collectionId,
    required this.updateToDoEntry,
  }) : super(ToDoEntryItemLoadingState());

  final EntryId entryId;
  final CollectionId collectionId;
  final LoadToDoEntry loadToDoEntry;
  final UpdateToDoEntry updateToDoEntry;

  Future<void> fetch() async {
    try {
      final entry = loadToDoEntry.call(ToDoEntryIdsParam(
        collectionId: collectionId,
        entryId: entryId,
      ));

      return entry.fold((left) => emit(ToDoEntryItemErrorState()),
          (right) => emit(ToDoEntryItemLoadedState(toDoEntry: right)));
    } on Exception {
      emit(ToDoEntryItemErrorState());
    }
  }

  Future<void> update() async {
    try {
      final updatedEntry = await updateToDoEntry.call(
          ToDoEntryIdsParam(collectionId: collectionId, entryId: entryId));
      return updatedEntry.fold((left) => emit(ToDoEntryItemErrorState()),
          (right) => emit(ToDoEntryItemLoadedState(toDoEntry: right)));
    } on Exception catch (e) {
      emit(ToDoEntryItemErrorState());
    }
  }
}
