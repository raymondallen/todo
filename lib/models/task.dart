class Task {
  final String name;
  bool isComplete;

  Task({this.name, this.isComplete = false});

  @override
  String toString() {
    return '{ name: ${this.name}, complete: ${this.isComplete} }';
  }
}
