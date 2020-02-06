import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/bottom_navigation_model.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/ui/main_bottom_navigation.dart';

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