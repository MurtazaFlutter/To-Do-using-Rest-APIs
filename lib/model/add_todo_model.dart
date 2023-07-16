import 'dart:convert';

class AddTODOModel {
  final String title;
  final String id;
  final String createdAt;
  final String updatedAt;
  final String description;
  final bool isCompleted;

  AddTODOModel(
    this.title,
    this.description,
    this.isCompleted,
    this.id,
    this.createdAt,
    this.updatedAt,
  );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory AddTODOModel.fromMap(Map<String, dynamic> map) {
    return AddTODOModel(
      map['title'],
      map['id'],
      map['createdAt'],
      map['updatedAt'],
      map['description'],
      map['isCompleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddTODOModel.fromJson(String source) =>
      AddTODOModel.fromMap(json.decode(source));
}
