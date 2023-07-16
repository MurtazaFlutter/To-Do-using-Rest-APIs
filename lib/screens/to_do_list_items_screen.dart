import 'package:flutter/material.dart';
import 'package:todo_rest_apis/screens/add_to_do_screen.dart';

class ToDoListItemsScreen extends StatelessWidget {
  const ToDoListItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: ListView(
          children: const [],
        ));
  }
}
