import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prototype_todo_app/pages/home.dart';
import 'provider/todos.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Todo App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(create: (context) => TodosProvider(),
  child:MaterialApp(
  debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Color(0xFFf6f5ee),
    ),
    home: Home(),
  ),
  );
}