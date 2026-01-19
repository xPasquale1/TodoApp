import 'package:flutter/material.dart';
import 'package:todo_app/pages/tasks_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(brightness: Brightness.dark),
      ),
      home: TasksPage(pageTitle: 'Tasks'),
    );
  }
}
