import 'package:flutter/material.dart';
import 'package:prototype_todo_app/model/todo.dart';
import 'package:prototype_todo_app/provider/todos.dart';
import 'package:prototype_todo_app/widgets/todo_form.dart';
import 'package:provider/provider.dart';

class AddToDoDialogWidget extends StatefulWidget {
  @override
  _AddToDoDialogWidgetState createState() => _AddToDoDialogWidgetState();
}

class _AddToDoDialogWidgetState extends State<AddToDoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
    key: _formKey,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Voeg To Do toe',
            style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
    )
      ),
      const SizedBox(height: 8),
      TodoFormWidget(
        onChangedTitle:(title) => setState(() => this.title = title),
        onSavedTodo: addTodo,
      )
    ],
    ),
  ),
  );

void addTodo() {
  final isValid =_formKey.currentState.validate();
  if (!isValid) {
    return;
  } else {
    final todo = Todo(
      id: DateTime.now().toString(),
      title: title,

    );
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.addTodo(todo);

    Navigator.of(context).pop();
  }
}

}