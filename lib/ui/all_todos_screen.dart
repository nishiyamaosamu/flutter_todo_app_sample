import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/ui/parts/todo_list_view.dart';

class AllTodosScreen extends StatelessWidget {
  AllTodosScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TodoModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("All Todos"),
      ),
      body: TodoListView(list: model.allTodoList),        
    );
  }
}