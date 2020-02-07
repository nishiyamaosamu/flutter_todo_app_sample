import 'package:todo_app/service/database.dart';
import 'package:todo_app/entity/todo.dart';

class TodoDao {
  final dbProvider = DatabaseService.dbProvider;
  final tableName = DatabaseService.todoTableName;

  Future<int> create(Todo todo) async {
    final db = await dbProvider.database;
    var result = db.insert(tableName, todo.toDatabaseJson());
    return result;
  }

  Future<List<Todo>> getAll() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result = await db.query(tableName);
    List<Todo> todos = result.isNotEmpty
        ? result.map((item) => Todo.fromDatabaseJson(item)).toList()
        : [];
    return todos;
  }

  Future<int> update(Todo todo) async {
    final db = await dbProvider.database;
    var result = await db.update(tableName, todo.toDatabaseJson(),
        where: "id = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int> delete(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  //not use this sample
  Future deleteAll() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      tableName,
    );

    return result;
  }

}