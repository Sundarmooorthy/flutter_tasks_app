import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/Blocs/bloc.exports.dart';

import '../Models/task.dart';
import '../Widgets/tasks_list.dart';

// import 'package:flutter_tasks_app/Widgets/tasks_list.dart';

// import '../Models/task.dart';

// ignore: must_be_immutables
class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);
  static const id = ' completed_task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    "${tasksList.length} Tasks ",
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
