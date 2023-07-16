import 'package:flutter/material.dart';

class ToDoListItemsScreen extends StatelessWidget {
  const ToDoListItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Add TODO"),
      ),
      body: const Text("data"),
    );
  }
}
