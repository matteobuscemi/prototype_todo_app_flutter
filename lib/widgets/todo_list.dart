import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prototype_todo_app/model/todo.dart';
import 'package:prototype_todo_app/provider/todos.dart';
import 'package:prototype_todo_app/widgets/todo_widget.dart';


class ToDoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
      ? Center(
        child:Text(
        'Geen todos!',
        style: TextStyle(fontSize: 20),
    ),
    )
        : ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: todos.length,
      itemBuilder:(context, index) {
      final todo = todos[index];

      return TodoWidget(todo: todo);
      },
    );
  }

}