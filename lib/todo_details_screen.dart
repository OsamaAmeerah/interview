import 'package:flutter/material.dart';

import 'model/model.dart';

class TodoDetailScreen extends StatelessWidget {
  final ListModel todo;

  const TodoDetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Todo: ${todo.todo}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Completed: ${todo.complete ? "Yes" : "No"}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'User ID: ${todo.userId}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}