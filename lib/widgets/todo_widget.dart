import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:prototype_todo_app/provider/todos.dart';
import 'package:provider/provider.dart';
import 'package:prototype_todo_app/model/todo.dart';

import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
     @required this.todo,
    Key key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Slidable(
    actionPane: SlidableDrawerActionPane(),
      key: Key(todo.id),
      actions: [
        IconSlideAction(
          color: Colors.green,
          onTap: () {
            final provider =
                Provider.of<TodosProvider>(context, listen: false);
            final isDone = provider.toggleTodoStatus(todo);
            Utils.showSnackBar(
              context,
              isDone ? 'Todo is voltooid!' : 'Todo is nog niet voltooid!',
            );
          },
          caption: 'Voltooid',
          icon: Icons.check,

        )
      ],
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          caption: 'Verwijder',
          onTap: () => deleteTodo(context, todo),
          icon: Icons.delete,
        )
      ],
      child: buildTodo(context),
  );

     Widget buildTodo(BuildContext context) => Container(
color: Colors.white,
  padding: EdgeInsets.all(20),
      child: Row (
    children: [
      const SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 22,
              ),
            )
          ],
        ),
      )
    ],
  ),
  );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Todo verwijdert!');
  }
}
