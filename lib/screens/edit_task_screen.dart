import 'package:flutter/material.dart';
// import 'package:flutter_tasks_app/Blocs/bloc.exports.dart';
import 'package:flutter_tasks_app/Blocs/bloc.exports.dart';
// import '../Blocs/TaskBloc/tasks_bloc.dart';
import '../Models/task.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
  const EditTaskScreen({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);

    return Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                " Edit Task",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                    border: OutlineInputBorder(),
                  ),
                  controller: titleController,
                ),
              ),
              TextField(
                autofocus: true,
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(),
                ),
                controller: descriptionController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel "),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var editedTask = Task(
                        date: DateTime.now().toString(),
                        description: descriptionController.text,
                        title: titleController.text,
                        id: oldTask.id,
                        isFavorite: oldTask.isFavorite,
                        isDone: false,
                      );
                      context.read<TasksBloc>().add(EditTask(
                            oldTask: oldTask,
                            newTask: editedTask,
                          ));
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
