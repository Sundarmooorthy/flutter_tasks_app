import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/Blocs/bloc.exports.dart';
import 'package:flutter_tasks_app/screens/recycle_bin.dart';
import 'package:flutter_tasks_app/screens/tab_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: Text(
            "Task drawer",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
          return GestureDetector(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(TabScreen.id),
            child: ListTile(
              leading: const Icon(Icons.folder_special),
              title: const Text("My Tasks"),
              trailing: Text("${state.completedTasks.length}"),
            ),
          );
        }),
        const Divider(),
        BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
          return GestureDetector(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(RecycleBin.id),
            child: ListTile(
              leading: const Icon(Icons.delete),
              title: const Text("Bin"),
              trailing: Text(
                  "${state.pendingTasks.length}  ${state.completedTasks.length} "),
            ),
          );
        }),
        BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return Switch(
                value: state.switchValue,
                onChanged: (newValue) {
                  newValue
                      ? context.read<SwitchBloc>().add(SwitchOnEvent())
                      : context.read<SwitchOffEvent>().add(SwitchOffEvent());
                });
          },
        ),
      ],
    ));
  }
}
