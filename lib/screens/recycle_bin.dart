import 'package:flutter/material.dart';
// import 'package:flutter_tasks_app/Blocs/TaskBloc/tasks_bloc.dart';
// import 'package:flutter_tasks_app/Blocs/TaskBloc/tasks_bloc.dart';
import 'package:flutter_tasks_app/Blocs/bloc.exports.dart';
import 'package:flutter_tasks_app/Widgets/tasks_list.dart';

import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = ' recycle_bin_screen ';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(" Recycle Bin  "),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete_forever),
                          label: const Text('Delete all Tasks'),
                        ),
                        onTap: () => context.read<TasksBloc>().add(
                              DeleteAllTasks(),
                            ),
                      ),
                    ]),
          ],
        ),
        drawer: const SafeArea(child: MyDrawer()),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  " ${state.removedTask.length} Tasks",
                ),
              ),
            ),
            TasksList(taskList: state.removedTask),
          ],
        ),
      );
    });
  }
}
