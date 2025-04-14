import 'package:flutter/material.dart';
import '../controller/todo_controller.dart';

class TodoListPage extends StatefulWidget {
  final TodoController todo;
  const TodoListPage({super.key,required this.todo});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.todo,
      builder: (BuildContext context, Widget? child) {
        return ListView.separated(
          itemCount: widget.todo.getLength(),
          separatorBuilder:
              (BuildContext context, int index) =>
                  Container(color: Colors.black, height: 1),
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(widget.todo.getTitle(index)),
              value: widget.todo.getDone(index),
              onChanged: (bool? value) {
                setState(() {
                  widget.todo.setDone(index, (value ?? false));
                });
              },
            );
          },
        );
      },
    );
  }


}
