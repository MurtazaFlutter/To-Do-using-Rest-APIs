import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_rest_apis/utils/utils.dart';
import '../model/add_todo_model.dart';

class TODOProvider extends ChangeNotifier {
  List<TODOModel> _todos = [];

  List<TODOModel> get todos => _todos;
  Future<void> addTodo(
      {required BuildContext context,
      required bool isCompleted,
      required String title,
      required String description}) async {
    try {
      TODOModel model = TODOModel(
        description: description,
        isCompleted: isCompleted,
        title: title,
      );
      http.Response response = await http.post(
        Uri.parse('http://api.nstack.in/v1/todos'),
        body: model.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Your To Do added! Go back to see');
          });
      notifyListeners();
      // ignore: use_build_context_synchronously
    } catch (e) {
      showSnackBar(context, e.toString());
      debugPrint(e.toString());
    }
  }

  Future<void> getTodos(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse("http://api.nstack.in/v1/todos?page=1&limit=10"),
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            final json = jsonDecode(response.body);
            final List<dynamic> todoJson = json['items'];
            _todos = todoJson.map((json) => TODOModel.fromJson(json)).toList();
          });

      notifyListeners();
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
