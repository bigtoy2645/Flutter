import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/1_domain/entities/todo_entry.dart';
import 'package:todo/1_domain/repositories/todo_repository.dart';
import 'package:todo/core/use_case.dart';

import '../failures/failures.dart';

class LoadToDoEntry implements UseCase<ToDoEntry, ToDoEntryIdsParam> {
  const LoadToDoEntry({
    required this.toDoRepository,
  });

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, ToDoEntry>> call(ToDoEntryIdsParam params) async {
    try {
      final loadedEntry =
          toDoRepository.readToDoEntry(params.collectionId, params.entryId);
      return loadedEntry.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
