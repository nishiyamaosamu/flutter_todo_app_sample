import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/entity/todo.dart';
import 'package:todo_app/model/bottom_navigation_model.dart';
import 'package:todo_app/model/todo_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationModel>(
          create: (context) => BottomNavigationModel(),
        ),
        ChangeNotifierProvider<TodoModel>(
          create: (context) => TodoModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainBottomNavigation(),
      ),
    );   
  }
}

class MainBottomNavigation extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    final bottomNavigationModel = Provider.of<BottomNavigationModel>(context, listen: true);
    return Scaffold(
      body: Center(
        child: bottomNavigationModel.getSelectedScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('すべて'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            title: Text('未完了'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            title: Text('完了'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavigationModel.selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          bottomNavigationModel.change(index);
        },
      ),
      floatingActionButton: AddTodoButton(),
    );
  }
}

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TodoModel>(context, listen: true);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        model.add(Todo(title: "test"));
      },
    );
  }
}
