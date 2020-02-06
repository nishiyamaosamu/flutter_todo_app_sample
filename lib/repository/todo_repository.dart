import 'package:todo_app/dao/todo_dao.dart';
import 'package:todo_app/entity/todo.dart';

class TodoRepository {
  final todoDao = TodoDao();

  Future getAllTodos() => todoDao.getAll();

  Future insertTodo(Todo todo) => todoDao.create(todo);

  Future updateTodo(Todo todo) => todoDao.update(todo);

  //not use this sample
  Future deleteTodoById(int id) => todoDao.delete(id);

  //not use this sample
  Future deleteAllTodos() => todoDao.deleteAll();
}
