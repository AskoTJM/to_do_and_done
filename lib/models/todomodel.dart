import 'package:flutter/material.dart';
import 'package:to_do_and_done/consts/consts.dart';

class ToDoModel extends ChangeNotifier {
  var _todoState = todo_choices.doing;
  var _prevToDoState;
  var _idToEdit = 0;

  static List<Todo> todoList = [
    Todo(
        id: 1,
        status: todo_choices.todo,
        todo: "testTodo1",
        details: "testDetailsTodo1"),
    Todo(
        id: 2,
        status: todo_choices.doing,
        todo: "testToDoing2",
        details: "testDetailsDoing2"),
    Todo(
        id: 3,
        status: todo_choices.done,
        todo: "testDone3",
        details: "testDetailsDone3"),
    Todo(
        id: 8,
        status: todo_choices.todo,
        todo: "testTodo4",
        details: "testDetailsTodo4"),
    Todo(
        id: 5,
        status: todo_choices.doing,
        todo: "testToDoing5",
        details: "testDetailsDoing5"),
    Todo(
        id: 6,
        status: todo_choices.done,
        todo: "testToDone6",
        details: "testDetailsDone6")
  ];

  setIdToEdit(int id) {
    _idToEdit = id;
  }

  getIdToEdit() {
    return _idToEdit;
  }

  changeState(todo_choices choice) {
    _prevToDoState = _todoState;
    _todoState = choice;
  }

  getState() {
    return _todoState;
  }

  getPrevState() {
    return _prevToDoState;
  }

  Todo getById(int id) {
    var _todoToEdit = todoList.firstWhere((todo) => todo.id == id);

    return Todo(
        id: _todoToEdit.id,
        status: _todoToEdit.status,
        todo: _todoToEdit.todo,
        details: _todoToEdit.todo);
  }

  getListByStatus() {
    return (todoList.where((todo) => todo.status == _todoState).toList());
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
}
