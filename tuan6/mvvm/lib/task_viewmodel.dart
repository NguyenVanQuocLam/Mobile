import 'package:flutter/material.dart';
import 'task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final List<TaskModel> _tasks = [
    TaskModel(
      id: '1',
      title: 'Complete Android Project',
      description: 'Finish the UI, integrate API, and write documentation',
      status: TaskStatus.pending,
    ),
    TaskModel(
      id: '2',
      title: 'Complete Android Project',
      description: 'Finish the UI, integrate API, and write documentation',
      status: TaskStatus.inProgress,
    ),
    TaskModel(
      id: '3',
      title: 'Complete Android Project',
      description: 'Finish the UI, integrate API, and write documentation',
      status: TaskStatus.completed,
    ),
    TaskModel(
      id: '4',
      title: 'Complete Android Project',
      description: 'Finish the UI, integrate API, and write documentation',
      status: TaskStatus.pending,
    ),
  ];

  List<TaskModel> get tasks => _tasks;

  void addTask(String title, String description) {
    final newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
    );
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTaskStatus(String id, TaskStatus status) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(status: status);
      notifyListeners();
    }
  }

  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  Color getTaskColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.pending:
        return Colors.blue.shade200;
      case TaskStatus.inProgress:
        return Colors.orange.shade200;
      case TaskStatus.completed:
        return Colors.green.shade200;
    }
  }
}