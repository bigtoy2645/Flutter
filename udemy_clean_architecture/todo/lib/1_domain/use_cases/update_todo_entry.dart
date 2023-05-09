import 'package:either_dart/src/either.dart';
import 'package:todo/1_domain/failures/failures.dart';
import 'package:todo/1_domain/repositories/todo_repository.dart';
import 'package:todo/core/use_case.dart';
import 'package:either_dart/either.dart';

import '../entities/todo_entry.dart';

class UpdateToDoEntry implements UseCase<ToDoEntry, ToDoEntryIdsParam> {
  UpdateToDoEntry({required this.toDoRepository});
  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, ToDoEntry>> call(ToDoEntryIdsParam params) async {
    try {
      final loadedEntry = await toDoRepository.updateToDoEntry(
          collectionId: params.collectionId, entryId: params.entryId);
      return loadedEntry.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
