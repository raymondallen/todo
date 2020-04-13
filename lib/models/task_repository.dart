import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'task.dart';

class TaskRepository extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      name: 'Buy groceries',
    ),
    Task(name: 'Take rubbish out'),
  ];
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void add(String name) {
    _tasks.add(Task(name: name));
    notifyListeners();
  }

  void toggleComplete(int index) {
    _tasks[index].isComplete = !_tasks[index].isComplete;
    notifyListeners();
  }

  void delete(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _tasks.clear();
    notifyListeners();
  }

  int get taskCount => _tasks.length;
}
