
class Todo {
  int id;
  String title;
  bool isDone;

  Todo({this.id, this.title, this.isDone = false});

  factory Todo.fromDatabaseJson(Map<String, dynamic> data) => Todo(
    id: data['id'],
    title: data['title'],
    isDone: data['is_done'] == 1 ? true : false,
  );

  Map<String, dynamic> toDatabaseJson() => {
    "id": this.id,
    "title": this.title,
    "is_done": this.isDone ? 1 : 0,
  };
}