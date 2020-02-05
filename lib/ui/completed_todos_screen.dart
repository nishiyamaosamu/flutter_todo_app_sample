import 'package:flutter/material.dart';

class CompletedTodosScreen extends StatelessWidget {
  CompletedTodosScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Completed Todos"),
        ),
        body: Center(
          child: Text("CompletedTodosScreen"),
        ),
        // floatingActionButton: WidgetBtn(),
    );
  }
}