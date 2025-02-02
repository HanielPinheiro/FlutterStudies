enum TaskType { today, planned, urgent }

class TaskTypeRelations {
  static const String urgentStr = "Urgent";
  static const String plannedStr = "Planned";
  static const String todayStr = "Today";
  static const Map<TaskType, String> enumToString = {TaskType.today: todayStr, TaskType.urgent: urgentStr, TaskType.planned: plannedStr};
  static const Map<String, TaskType> stringToEnum = {todayStr: TaskType.today, urgentStr: TaskType.urgent, plannedStr: TaskType.planned};
}

const String tableName = "tasks";
const String idField = "_id";
const String titleField = "title";
const String descriptionField = "description";
const String dueDateField = "due_date";
const String taskTypeField = "task_type";
const String isDoneField = "is_done";

const List<String> taskColumns = [idField, titleField, descriptionField, dueDateField, taskTypeField, isDoneField];

const String boolType = "BOOLEAN NOT NULL";
const String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
const String textTypeNullable = "TEXT";
const String textType = "TEXT NOT NULL";

class Task {
  final int? id;
  final String title;
  final String? description;
  final DateTime dueDate;
  final TaskType taskType;
  final bool isDone;

  Task({this.id, required this.title, this.description, required this.dueDate, required this.taskType, required this.isDone});

  static Task fromJson(Map<String, dynamic> json) => Task(
        id: json[idField] as int?,
        title: json[titleField] as String,
        description: json[descriptionField] as String?,
        dueDate: DateTime.parse(json[dueDateField] as String),
        taskType: TaskTypeRelations.stringToEnum[json[taskTypeField] as String]!,
        isDone: json[isDoneField] == 1,
      );

  Map<String, dynamic> toJson() => {
    idField: id,
    titleField: title,
    descriptionField: description,
    dueDateField: dueDate.toIso8601String(),
    taskTypeField: taskType.name,
    isDoneField: isDone ? 1 : 0,
  };

  Task copyWith({int? id, String? title, String? description, DateTime? dueDate, TaskType? taskType, bool? isDone}) =>
      Task(id: id ?? this.id, title: title ?? this.title, description: description ?? this.description, dueDate: dueDate ?? this.dueDate,
          taskType: taskType ?? this.taskType, isDone: isDone ?? this.isDone);
}
