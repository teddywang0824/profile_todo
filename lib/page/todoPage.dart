import 'package:flutter/material.dart';
import '../modal/todolistModal.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<TodoItem> _todos = [
    TodoItem(title: '完成 Flutter UI 練習'),
    TodoItem(title: '買牛奶'),
    TodoItem(title: '寫作業'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _todos.length,
      separatorBuilder: (BuildContext context, int index) => Container(color: Colors.black,height: 1,),
      itemBuilder: (context, index) {
        return CheckboxListTile(
          title: Text(_todos[index].title),
          value: _todos[index].isDone,
          onChanged: (bool? value) {
            setState(() {
              _todos[index].isDone = value ?? false;
            });
          },
        );
      },
    );
  }
}