import 'dart:convert';

class TODOModel {
  final String title;
  final String description;
  final bool isCompleted;

  TODOModel(
    this.title,
    this.description,
    this.isCompleted,
  );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory TODOModel.fromMap(Map<String, dynamic> map) {
    return TODOModel(
      map['title'] ?? '',
      map['description'] ?? '',
      map['isCompleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TODOModel.fromJson(String source) =>
      TODOModel.fromMap(json.decode(source));
}
