import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/1_domain/use_cases/load_todo_collections.dart';
import 'package:todo/2_application/pages/overview/todo_overview_cubit.dart';
import 'package:todo/2_application/pages/overview/todo_overview_error.dart';
import 'package:todo/2_application/pages/overview/todo_overview_loaded.dart';
import 'package:todo/2_application/pages/overview/todo_overview_loading.dart';

import '../../core/page_config.dart';

class ToDoOverviewPageProvider extends StatelessWidget {
  const ToDoOverviewPageProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoOverviewCubit(
        loadToDoCollections: LoadToDoCollections(
          toDoRepository: RepositoryProvider.of(context),
        ),
      )..readToDoCollections(),
      child: const OverviewPage(),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  static const pageConfig = PageConfig(
    icon: Icons.work_history_rounded,
    name: "overview",
    child: ToDoOverviewPageProvider(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: BlocBuilder<ToDoOverviewCubit, ToDoOverviewCubitState>(
        builder: (context, state) {
          if (state is ToDoOverviewCubitLoadingState) {
            return const ToDoOverviewLoading();
          } else if (state is ToDoOverviewCubitLoadedState) {
            return ToDoOverviewLoaded(collections: state.collections);
          } else {
            return const ToDoOverviewError();
          }
        },
      ),
    );
  }
}
