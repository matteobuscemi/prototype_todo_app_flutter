import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';

}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    required this.id,
    this.isDone = false,
});


}