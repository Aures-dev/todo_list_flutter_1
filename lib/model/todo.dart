class Todo {
  final int id;
  final String description;
  bool isDone;

  Todo({
    required this.id,
    required this.description,
    this.isDone = false,
  });
}

List<Todo> todoList = [
  Todo(id: 1, description: "Faire les courses", isDone: true),
  Todo(id: 2, description: "Terminer le projet Flutter", isDone: false),
  Todo(id: 3, description: "Lire un chapitre du livre", isDone: true),
  Todo(id: 4, description: "Faire du sport", isDone: false),
  Todo(id: 5, description: "Appeler un ami", isDone: true),
];
