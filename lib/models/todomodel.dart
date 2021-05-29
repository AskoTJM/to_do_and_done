import 'package:flutter/material.dart';
import 'package:to_do_and_done/consts/consts.dart';

class ToDoModel extends ChangeNotifier {
  static List<Todo> todoList = [
    Todo(
        id: 1,
        status: todo_choices.todo,
        todo: "testTodo1",
        details: "testDetails1"),
    Todo(
        id: 2,
        status: todo_choices.doing,
        todo: "testTodo2",
        details: "testDetails2"),
    Todo(
        id: 3,
        status: todo_choices.done,
        todo: "testTodo3",
        details: "testDetails3")
  ];

  Todo getById(int id) => Todo(
      id: id,
      status: todoList[id].status,
      todo: todoList[id].todo,
      details: todoList[id].todo);

  void createLists() {
    //List<Todo> allUserItems = Provider.of<ToDoModel.todoList>>(context, listen: true) ?? [];
    List<Todo> listToDo =
        todoList.where((todo) => todo.status == todo_choices.todo).toList();

    List<Todo> listDoing =
        todoList.where((todo) => todo.status == todo_choices.todo).toList();

    List<Todo> listDone =
        todoList.where((todo) => todo.status == todo_choices.todo).toList();

    notifyListeners();
  }
}

@immutable
class Todo {
  final int id;
  final String todo;
  final String details;
  final todo_choices status;

  Todo(
      {required this.id,
      required this.status,
      required this.todo,
      required this.details});

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Todo && other.id == id;
}
