import 'package:flutter/material.dart';
import 'package:todo_list_flutter_1/components/drawer_option_list.dart';
import 'package:todo_list_flutter_1/components/navbar_bottom.dart';
import 'package:todo_list_flutter_1/model/todo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String query = '';

  // appelé à chaque fois que ce que l'utilisateur entre change
  void onQueryChanged(String newQuery) {
    setState(() {
      query = newQuery;
    });
  }

  // méthode pour la recherche
  List<Todo> get filteredTodos {
    if (query.isEmpty) return todoList;
    return todoList
        .where((todo) =>
            todo.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Fonction pour ajouter une nouvelle tâche
  void addTodo(String description) {
    setState(() {
      todoList.add(Todo(
        id: todoList.length + 1,
        description: description,
        isDone: false,
      ));
    });
  }

  // Fonction pour supprimer une tâche
  void deleteTodo(Todo todo) {
    setState(() {
      todoList.removeWhere((el) => el.description == todo.description);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue[300],
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.account_circle_rounded,
              size: 50,
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        child: DrawerOptionList(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double
                  .infinity, // Permet à TextField de s'étendre correctement
              child: TextField(
                onChanged: onQueryChanged,
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTodos.length,
              itemBuilder: (context, position) {
                var todo = filteredTodos[position];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: todo.isDone,
                          onChanged: (bool? newValue) {
                            setState(() {
                              todo.isDone = newValue ?? false;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            todo.description, // Affiche la description
                            style: TextStyle(
                              fontSize: 22.0,
                              decoration: todo.isDone
                                  ? TextDecoration.lineThrough
                                  : null, // Texte barré si terminé
                            ),
                          ),
                        ),
                        // const SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red[600],
                            size: 25,
                          ),
                          onPressed: () {
                            deleteTodo(todo);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavbarBottom(
        onAddTodo: addTodo,
      ),
    );
  }
}
