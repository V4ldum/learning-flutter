class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void changeStatus() {
    isDone = !isDone;
  }
}
