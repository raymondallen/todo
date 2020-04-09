class Task {
  final String name;
  bool isComplete;

  Task({this.name, this.isComplete = false});

  void toggleComplete() {
    isComplete = !isComplete;
  }

  @override
  String toString() {
    return '{ name: ${this.name}, complete: ${this.isComplete} }';
  }
}
