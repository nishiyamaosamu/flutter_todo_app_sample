import 'package:flutter/material.dart';
import 'package:todo_app/ui/all_todos_screen.dart';
import 'package:todo_app/ui/completed_todos_screen.dart';
import 'package:todo_app/ui/incompleted_todos_screen.dart';

class BottomNavigationModel with ChangeNotifier{  
  final List<Widget> options = [
    AllTodosScreen(),
    IncompletedTodosScreen(),
    CompletedTodosScreen(),
  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void change(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Widget getSelectedScreen() {
    return options[selectedIndex];
  }
}