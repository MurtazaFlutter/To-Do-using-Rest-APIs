import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/add_todo_model.dart';
import '../utils.dart/strings.dart';

class AddToDoController extends ChangeNotifier {
  void addTodo(
      {required BuildContext context,
      required bool isCompleted,
      required TextEditingController titleController,
      required TextEditingController desController}) async {
    final title = titleController.text;
    final desc = desController.text;

    try {
      AddTODOModel addTODOModel =
          AddTODOModel(title, desc, isCompleted, "", "", "");

      http.Response response = await http.post(
        Uri.parse('${baseUrl}todos'),
      );
    } catch (e) {}
  }
}
