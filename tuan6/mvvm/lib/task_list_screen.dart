import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_viewmodel.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          'List',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Consumer<TaskViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: viewModel.tasks.length,
            itemBuilder: (context, index) {
              final task = viewModel.tasks[index];
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: viewModel.getTaskColor(task.status),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      task.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 50, left: 10, right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 18,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SizedBox(
          height: 50,
          child: BottomAppBar(
            color: Colors.transparent,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.home, color: Colors.blue, size: 32),
                Icon(Icons.calendar_today, color: Colors.grey, size: 28),
                SizedBox(width: 48),
                Icon(Icons.description, color: Colors.grey, size: 28),
                Icon(Icons.settings, color: Colors.grey, size: 28),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}