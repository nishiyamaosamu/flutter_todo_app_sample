import 'package:flutter/material.dart';

class IncompletedTodosScreen extends StatelessWidget {
  IncompletedTodosScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Incompleted Todos"),
        ),
        body: Center(
          child: Text("IncompletedTodosScreen"),
        ),
        // floatingActionButton: WidgetBtn(),
    );
  }
}