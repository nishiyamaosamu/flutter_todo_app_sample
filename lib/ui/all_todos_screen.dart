import 'package:flutter/material.dart';
import 'package:todo_app/entity/todo.dart';
import 'package:todo_app/ui/parts/todo_list_tile.dart';

class AllTodosScreen extends StatelessWidget {
  AllTodosScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Todos"),
        ),
        body: Center(
          child: ListView(children: <Widget>[
            TodoListTile(todo: Todo(title: "aaa"),)
          ],),
        ),
        // floatingActionButton: WidgetBtn(),
    );
  }
}