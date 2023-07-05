// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class RemovedTask extends TasksEvent {
  final Task task;
  const RemovedTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class MarkFavoriteOrUnfavoriteTask extends TasksEvent {
  final Task task;
  const MarkFavoriteOrUnfavoriteTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class EditTask extends TasksEvent {
  final Task oldTask;
  final Task newTask;
  const EditTask({
    required this.newTask,
    required this.oldTask,
  });

  @override
  List<Object> get props => [oldTask, newTask];

  get task => null;
}

class RestoredTask extends TasksEvent {
  final Task task;
  const RestoredTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteAllTasks extends TasksEvent {}
