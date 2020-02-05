import 'package:flutter/material.dart';
import 'package:todo_app/entity/todo.dart';

class TodoModel with ChangeNotifier{  
  List<Todo> _allTodoList = [];
  //repo

  TodoModel(){
    fetchAll();
  }

  List<Todo> getAllTodosList(){
    return _allTodoList;
  }
  List<Todo> getIncompletedTodosList(){
    return _allTodoList;
  }
  List<Todo> getCompletedTodosList(){
    return _allTodoList;
  }

  void fetchAll() {
    //todo
    notifyListeners();
  }

  void add(Todo todo) {
    //todo
    fetchAll();
  }

  void incomplete(Todo todo) {
    //todo
    fetchAll();
  }

  void update(Todo todo) {
    //todo
    fetchAll();
  }
}