import 'package:flutter/material.dart';
import 'package:prototype_todo_app/utils.dart';

class TodoField {

}

class Todo {
  String title;
  String id;
  bool isDone;

  Todo({
    @required this.title,
    @required this.id,
    this.isDone = false,
});

  static Todo fromJson(Map<String, dynamic> json) => Todo(
    title: json['title'],
    id: json['id'],
    isDone: json['isDone'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'id': id,
    'isDone': isDone,
  };

}