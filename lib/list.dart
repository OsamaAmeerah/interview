import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:interview/todo_details_screen.dart';

import 'model/model.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
   List<ListModel> todos = [];

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

   Future<void> fetchTodos() async {

       final response = await Dio().get('https://dummyjson.com/todos');
       if (response.statusCode == 200) {
         setState(() {
           todos = List<ListModel>.from(response.data['todos'].map((x) => ListModel.fromJson(x)));
         });
       }
   }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: todos == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.todo),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoDetailScreen(todo: todo),
                ),
              );
            },
          );
        },
      ),
    );
  }
}