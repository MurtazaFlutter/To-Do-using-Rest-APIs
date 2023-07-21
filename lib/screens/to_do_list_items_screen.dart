import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_rest_apis/controllers/add_to_do_controller.dart';
import 'package:todo_rest_apis/screens/add_to_do_screen.dart';

class ToDoListItemsScreen extends StatefulWidget {
  const ToDoListItemsScreen({super.key});

  @override
  State<ToDoListItemsScreen> createState() => _ToDoListItemsScreenState();
}

class _ToDoListItemsScreenState extends State<ToDoListItemsScreen> {
  @override
  void initState() {
    Provider.of<TODOProvider>(context, listen: false).getTodos(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TODOProvider>(context, listen: false);
    final List todos = todoProvider.todos;
    return Scaffold(
        appBar: AppBar(
          title: const Text('TODO List'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const AddTODOScreen())));
          },
          label: const Text("Add TODO"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            FutureBuilder(
                future: todoProvider.getTodos(context),
                builder: ((context, snapshot) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        print("todos $todo");
                        return ListTile(
                          title: Text(todo),
                        );
                      },
                    ),
                  );
                }))
          ],
        ));
  }
}
