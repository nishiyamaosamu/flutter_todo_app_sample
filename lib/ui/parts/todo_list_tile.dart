import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/entity/todo.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;

  const TodoListTile({
    Key key,
    @required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: _CheckBoxButton(todo: todo),
        title: Text(todo.title),
        trailing: _RemoveButton(todo: todo),
      ),
    );
  }
}

class _CheckBoxButton extends StatelessWidget {
  final Todo todo;

  const _CheckBoxButton({
    Key key, 
    @required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TodoModel>(context, listen: true);
    return FlatButton(
      child: todo.isDone ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
      onPressed: () {
        model.toggleIsDone(todo);
      },
    );
  }
}

class _RemoveButton extends StatelessWidget {
  final Todo todo;

  const _RemoveButton({
    Key key, 
    @required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TodoModel>(context, listen: true);
    return FlatButton(
      child: Icon(Icons.delete_forever),
      onPressed: () {
        model.remove(todo);
      },
    );
  }
}