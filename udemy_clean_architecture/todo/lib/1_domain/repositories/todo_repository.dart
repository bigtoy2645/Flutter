import 'package:either_dart/either.dart';
import 'package:todo/1_domain/entities/todo_collection.dart';

import '../failures/failures.dart';

abstract class ToDoRepository {
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections();
}
