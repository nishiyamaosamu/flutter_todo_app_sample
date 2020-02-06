import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/ui/parts/todo_list_tile.dart';

class CompletedTodosScreen extends StatelessWidget {
  CompletedTodosScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TodoModel>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: Text("Completed Todos"),
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var todo = model.completedTodoList[index];
              return TodoListTile(todo: todo);
            },
              itemCount: model.completedTodoList.length,
          ),
        ),
    );
  }
}