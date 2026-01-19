class Task {
  final int id;
  String title;
  String description;
  bool completed = false;

  Task({required this.id, required this.title, this.description = '', this.completed = false});

  Map<String, Object> toMap() {
    return {
      'title': title,
      'description': description,
      'completed': completed ? 1 : 0,
    };
  }
}
