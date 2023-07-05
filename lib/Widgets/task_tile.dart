import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/Models/task.dart';
import 'package:flutter_tasks_app/Widgets/pop_up_menu.dart';
import 'package:flutter_tasks_app/screens/edit_task_screen.dart';
import 'package:intl/intl.dart';
import '../Blocs/bloc.exports.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemovedTask(task: task));
  }

  void _editTask(buildContext, context) {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: EditTaskScreen(oldTask: task),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false
                    ? const Icon(Icons.favorite_outline_rounded)
                    : const Icon(Icons.favorite),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: task.isDone!
                                  ? TextDecoration.lineThrough
                                  : null)),
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_Hms()
                          .format(DateTime.parse(task.date))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        context.read<TasksBloc>().add(UpdateTask(task: task));
                      }
                    : null,
              ),
              PopupMenu(
                cancelOrDeleteCallback: () =>
                    _removeOrDeleteTask(context, task),
                likeOrDislikeCallback: () => context.read<TasksBloc>().add(
                      MarkFavoriteOrUnfavoriteTask(task: task),
                    ),
                editTaskCallback: () {
                  Navigator.of(context).pop();
                  _editTask(context, task);
                },
                restoredTaskCallback: () =>
                    context.read<TasksBloc>().add(RestoredTask(task: task)),
                task: task,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// 1 hr 57min sec 
// edit screen 





// ListTile(
//       title: Text(task.title,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//               decoration: task.isDone! ? TextDecoration.lineThrough : null)),
//       trailing: Checkbox(
//         value: task.isDone,
//         onChanged: task.isDeleted == false
            // ? (value) {
//                 context.read<TasksBloc>().add(UpdateTask(task: task));
//               }
//             : null,
//       ),
//       onLongPress: () => _removeOrDeleteTask(context, task),
//     );