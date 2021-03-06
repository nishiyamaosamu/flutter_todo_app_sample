import 'package:flutter/material.dart';
import 'package:todo_app/entity/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';

class TodoModel with ChangeNotifier{  
  List<Todo> _allTodoList = [];
  List<Todo> get allTodoList => _allTodoList;
  List<Todo> get incompletedTodoList => _allTodoList.where((todo) => todo.isDone == false).toList();
  List<Todo> get completedTodoList => _allTodoList.where((todo) => todo.isDone == true).toList();

  final TodoRepository repo = TodoRepository();

  TodoModel(){
    _fetchAll();
  }

  void _fetchAll() async {
    _allTodoList = await repo.getAllTodos();
    notifyListeners();
  }

  void add(Todo todo) async {
    await repo.insertTodo(todo);
    _fetchAll();
  }

  void update(Todo todo) async {
    await repo.updateTodo(todo);
    _fetchAll();
  }

  void toggleIsDone(Todo todo) async {
    todo.isDone = !todo.isDone;
    update(todo);
  }

  void remove(Todo todo) async {
    await repo.deleteTodoById(todo.id);
    _fetchAll();
  }

}