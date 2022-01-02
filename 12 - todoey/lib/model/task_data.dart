import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/model/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: "Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Make food"),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get length {
    return _tasks.length;
  }

  void addTask(String title) {
    _tasks.add(Task(name: title));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.changeStatus();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
