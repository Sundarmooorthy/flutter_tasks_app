import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/completed_tasks.dart';
import 'package:flutter_tasks_app/screens/pending_tasks.dart';

import 'add_task_screen.dart';
import 'favorite_tasks.dart';
import 'my_drawer.dart';

// ignore: must_be_immutable
class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const id = 'tabscreen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // ignore: unused_field
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTasksScreen(), 'title': 'Pending Tasks Screen'},
    {
      'pageName': const CompletedTasksScreen(),
      'title': 'Completed Tasks Screen'
    },
    {'pageName': const FavoriteTasksScreen(), 'title': 'Favorite Tasks Screen'},
  ];

  var _selectedPageIndex = 0;

  // ignore: unused_element
  void _addTask(buildContext, context) {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(BuildContext, context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: (_pageDetails[_selectedPageIndex]['pageName']),
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(BuildContext, context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            _selectedPageIndex = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_sharp),
              label: 'Pending Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label: 'Completed Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: 'Favorite Tasks',
            ),
          ]),
    );
  }
}
