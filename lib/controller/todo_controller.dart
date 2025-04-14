import 'package:flutter/material.dart';
import '../modal/todolistModal.dart';

class TodoController extends ChangeNotifier{
  final List<TodoItem> _todos = [
    TodoItem(title: '完成 Flutter UI 練習'),
    TodoItem(title: '買牛奶'),
    TodoItem(title: '寫作業'),
  ];

  void addTodo(String title) {
    _todos.add(TodoItem(title: title));
    notifyListeners();
  }

  void setDone(int index,bool done){
    _todos[index].isDone = done;
  }

  int getLength(){
    return _todos.length;
  }

  String getTitle(int index){
    return _todos[index].title;
  }

  bool getDone(int index){
    return _todos[index].isDone;
  }
}