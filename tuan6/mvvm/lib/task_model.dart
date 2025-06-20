class TaskModel {
  final String id;
  final String title;
  final String description;
  final TaskStatus status;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    this.status = TaskStatus.pending,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    TaskStatus? status,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}

enum TaskStatus { pending, inProgress, completed }