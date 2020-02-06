import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/entity/todo.dart';
import 'package:todo_app/model/bottom_navigation_model.dart';
import 'package:todo_app/model/todo_model.dart';

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
            title: Text('All'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            title: Text('Incompleted'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            title: Text('Completed'),
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
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AddTodoDialog();
          }
        );
      },
    );
  }
}

class AddTodoDialog extends StatelessWidget {
  AddTodoDialog({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TodoModel>(context, listen: true);
    final titleTextEditingController = TextEditingController();
    return SimpleDialog(
      title: Text("Add Todo"),
      contentPadding: EdgeInsets.all(16),
      children: <Widget>[
        TextField(                    
          controller: titleTextEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Write todo..."
          ),
        ),
        FlatButton(
          child: Text('Add'),
          color: Colors.blue,
          onPressed: () {
            model.add(Todo(title: titleTextEditingController.text));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}