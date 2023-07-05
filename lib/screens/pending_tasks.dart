import 'package:flutter/material.dart';

import 'package:flutter_tasks_app/Widgets/tasks_list.dart';

import '../Blocs/bloc.exports.dart';

import '../Models/task.dart';

// ignore: must_be_immutable
class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);
  static const id = 'task screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    "${tasksList.length} Pending ${state.completedTasks.length} Completed ",
                  ),
                ),
              ),
              TasksList(taskList: tasksList),
            ],
          ),
        );
      },
    );
  }

  // _addTask(BuildContext context) {}
}


// class _addTask {
//   _addTask(BuildContext context);
// }
