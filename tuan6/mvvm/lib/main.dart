
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_viewmodel.dart';
import 'task_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TaskListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}