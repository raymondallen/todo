import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/tasks_screen.dart';
import 'package:todo/models/task_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todo App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ChangeNotifierProvider<TaskRepository>(
        create: (_) => TaskRepository(),
        child: TasksScreen(),
      ),
    );
  }
}
