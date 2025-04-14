import 'package:flutter/material.dart';
import 'page/profilePage.dart';
import 'page/todoPage.dart';
import 'controller/todo_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '教學用 Flutter UI 範例',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late TodoController todo;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    todo = TodoController();
    _pages = [ProfilePage(), TodoListPage(todo: todo,)];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter UI 教學')),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '個人介紹'),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: '代辦清單',
          ),
        ],
      ),
    );
  }

  void _addTask(BuildContext context) {
    String newTask = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('新增待辦事項'),
          content: TextField(
            onChanged: (value) => newTask = value,
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('取消'),
            ),
            ElevatedButton(
              onPressed: () {
                if (newTask.isNotEmpty) {
                  todo.addTodo(newTask);
                  Navigator.pop(context);
                }
              },
              child: Text('新增'),
            ),
          ],
        );
      },
    );
  }
}
