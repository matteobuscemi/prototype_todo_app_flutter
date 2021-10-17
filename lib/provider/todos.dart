import 'package:flutter/cupertino.dart';
import 'package:prototype_todo_app/model/todo.dart';

class TodosProvider extends ChangeNotifier {
List<Todo> _todos = [
  Todo(
    createdTime: DateTime.now(),
    title: 'Walk the dog',
    id: '',
  )
];

List<Todo> get todos => _todos.where((todo) => todo.isDone == false ).toList();

List<Todo> get todosCompleted =>
    _todos.where((todo) => todo.isDone == true).toList();

void addTodo(Todo todo) {
  _todos.add(todo);

  notifyListeners();
}

void removeTodo(Todo todo){
  _todos.remove(todo);

  notifyListeners();
}

bool toggleTodoStatus(Todo todo) {
  todo.isDone = !todo.isDone;
  notifyListeners();

  return todo.isDone;
}

}