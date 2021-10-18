import 'package:flutter/material.dart';
import 'package:prototype_todo_app/api/firebase_api.dart';
import 'package:prototype_todo_app/main.dart';
import 'package:prototype_todo_app/model/todo.dart';
import 'package:prototype_todo_app/provider/todos.dart';
import 'package:prototype_todo_app/widgets/completed_list.dart';
import 'package:prototype_todo_app/widgets/todo_dialog.dart';
import 'package:prototype_todo_app/widgets/todo_list.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ToDoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size:28),
            label: 'Voltooid',
          ),
        ],

      ),
      body: StreamBuilder<List<Todo>>(
        stream: FirebaseApi.readTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text('Something Went Wrong Try Later');
              } else {
                final todos = snapshot.data;

                final provider = Provider.of<TodosProvider>(context);
                provider.setTodos(todos);

                return tabs[selectedIndex];
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddToDoDialogWidget(),
          barrierDismissible: false,

        ),
        child: Icon(Icons.add),
      ),
    );
  }

}
