import 'dart:convert';

class TODOModel {
  final String title;
  final String description;
  final bool isCompleted;

  TODOModel({
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'is_completed': isCompleted,
    };
  }

  factory TODOModel.fromJson(Map<String, dynamic> json) {
    return TODOModel(
      description: json['description'] ?? '',
      isCompleted: json['is_completed'] ?? false,
      title: json['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}
